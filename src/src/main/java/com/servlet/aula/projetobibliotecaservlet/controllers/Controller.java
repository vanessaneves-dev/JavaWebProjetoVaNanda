package com.servlet.aula.projetobibliotecaservlet.controllers;

import com.servlet.aula.projetobibliotecaservlet.dao.BookDao;
import com.servlet.aula.projetobibliotecaservlet.dao.LoggerDao;
import com.servlet.aula.projetobibliotecaservlet.models.Book;
import com.servlet.aula.projetobibliotecaservlet.models.Logger;
import com.servlet.aula.projetobibliotecaservlet.service.AuthenticationService;
import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/login", "/newuser", "/home", "/cadastrar", "/atualizar", "/excluir"})
public class Controller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Inject
    private BookDao bookDao;

    @Inject
    private LoggerDao loggerDao;

    private AuthenticationService authService;

    @Override
    public void init() {
        this.bookDao = new BookDao();
        this.loggerDao = new LoggerDao();
        this.authService = new AuthenticationService(loggerDao);
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
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        Book book = bookDao.listarLivros().stream()
                .filter(livro -> livro.getIsbn().equals(isbn))
                .findFirst()
                .orElse(null);

        if (book != null) {
            updateBookDetails(request, book);
            bookDao.atualizar(book);
            response.sendRedirect("home");
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Livro não encontrado");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        if (isbn != null) {
            bookDao.remover(isbn);
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ISBN não fornecido");
        }
    }

    private void forwardToPage(HttpServletRequest request, HttpServletResponse response, String page) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher(page);
        rd.forward(request, response);
    }

    private void handleNewUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Logger newLogger = new Logger(nome, email, password);
        Logger registerUser = authService.registerUser(newLogger);
        if (registerUser != null) {
            request.getSession().setAttribute("existingUser", registerUser);
            response.sendRedirect("login");
        } else {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Esse usuário já existe.");
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Logger authenticatedUser = authService.authenticate(email, password);

        if (authenticatedUser != null) {
            request.getSession().setAttribute("user", authenticatedUser);
            response.sendRedirect("home");
        } else {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Usuário não encontrado.");
        }
    }

    private void handleAddBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String isbn = request.getParameter("isbn");
        String titulo = request.getParameter("titulo");
        String categoria = request.getParameter("categoria");
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));

        Book book = new Book(isbn, titulo, categoria, quantidade);
        bookDao.cadastrar(book);
        response.sendRedirect("home");
    }

    private void updateBookDetails(HttpServletRequest request, Book book) {
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
    }
}