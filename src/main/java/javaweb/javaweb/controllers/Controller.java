package javaweb.javaweb.controllers;

import jakarta.servlet.annotation.MultipartConfig;
import javaweb.javaweb.dao.*;
import javaweb.javaweb.model.*;
import javaweb.javaweb.service.AuthenticationService;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/login", "/newuser", "/home", "/cadastrar", "/atualizar", "/logout", "/termos"})
@MultipartConfig
public class Controller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Inject
    private BookDao bookDao;

    @Inject
    private IsUserDao isUserDao;

    private AuthenticationService authService;

    @Override
    public void init() {
        this.bookDao = new BookDao();
        this.isUserDao = new IsUserDao();
        this.authService = new AuthenticationService(isUserDao);
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getMethod();
        switch (method) {
            case "GET":
                doGet(request, response);
                break;
            case "POST":
                doPost(request, response);
                break;
            case "PUT":
                doPut(request, response);
                break;
            case "DELETE":
                doDelete(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        switch (path) {
            case "/home":
                List<Book> livros = bookDao.listarLivros();
                request.setAttribute("listaLivros", livros);
                forwardToPage(request, response, "home.jsp");
                break;
            case "/cadastrar":
                forwardToPage(request, response, "newBook.jsp");
                break;
            case "/login":
                forwardToPage(request, response, "index.jsp");
                break;
            case "/logout":
                handleLogout(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        switch (path) {
            case "/newuser":
                handleNewUser(request, response);
                break;
            case "/login":
                handleLogin(request, response);
                break;
            case "/cadastrar":
                handleAddBook(request, response);
                break;
            case "/logout":
                handleLogout(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }


    }

   /* @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        Book book = bookDao.buscarLivroPorIsbn(isbn);
                *//*.filter(livro -> livro.getIsbn().equals(isbn))
                .findFirst()
                .orElse(null);*//*

        if (book != null) {
            updateBookDetails(request, book);
            bookDao.atualizar(book);
            response.sendRedirect("home");
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Livro não encontrado");
        }
    }*/

   /* @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        if (isbn != null) {
            bookDao.remover(isbn);
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ISBN não fornecido");
        }
    }*/

    private void forwardToPage(HttpServletRequest request, HttpServletResponse response, String page) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher(page);
        rd.forward(request, response);
    }

    private void handleNewUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        IsUser newIsUser = new IsUser(nome, email, password);
        IsUser registerUser = authService.registerUser(newIsUser);
        if (registerUser != null) {
            request.getSession().setAttribute("existingUser", registerUser);
            response.sendRedirect("login.jsp");
        } else {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Esse usuário já existe.");
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        IsUser authenticatedUser = authService.authenticate(email, password);

        if (authenticatedUser != null) {
            request.getSession().setAttribute("user", authenticatedUser);
            response.sendRedirect("home");
        } else {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Usuário não encontrado.");
        }
    }

    private void handleAddBook(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String isbn = request.getParameter("isbn");
        String titulo = request.getParameter("titulo");
        String categoria = request.getParameter("categoria");
        String quantidade = request.getParameter("quantidade");
        Part filePart = request.getPart("imagem");
        String imagem = null;

        int qtd;
        try {
            qtd = Integer.parseInt(quantidade);
            if (qtd < 1) {
                qtd = 1; // Define a quantidade mínima como 1
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Quantidade deve ser um número válido.");
            return;
        }

        if (filePart != null && filePart.getSize() > 0) {
            String fileName = filePart.getSubmittedFileName();
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            imagem = "uploads" + File.separator + fileName;
            filePart.write(uploadPath + File.separator + fileName);
        } else {
            // Define um avatar padrão se nenhuma imagem for fornecida
            imagem = "./images/livroAvatar.png";
        }

        Book book = new Book(isbn, titulo, categoria, qtd, imagem);
        bookDao.cadastrar(book);
        response.sendRedirect("home");
    }

    /*private void updateBookDetails(HttpServletRequest request, Book book) {
        String titulo = request.getParameter("titulo");
        String categoria = request.getParameter("categoria");
        String quantidade = request.getParameter("quantidade");

        if (titulo != null && !titulo.isEmpty()) {
            book.setTitulo(titulo);
        }
        if (categoria != null && !categoria.isEmpty()) {
            book.setCategoria(categoria);
        }
        if (quantidade != null && !quantidade.isEmpty()) {
            book.setQuantidade(Integer.parseInt(quantidade));
        }
    }*/

    private void handleLogout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookie.setValue("");
                cookie.setPath("/");
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }

        response.sendRedirect("login.jsp");
    }
}