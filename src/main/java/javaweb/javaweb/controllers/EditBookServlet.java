package javaweb.javaweb.controllers;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import javaweb.javaweb.dao.BookDao;
import javaweb.javaweb.model.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

@WebServlet("/editBook")
@MultipartConfig
public class EditBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookDao bookDao;

    @Override
    public void init() {
        this.bookDao = new BookDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String isbn = request.getParameter("isbn");
        Book livro = bookDao.buscarLivroPorIsbn(isbn);
        request.setAttribute("livro", livro);
        request.getRequestDispatcher("editBook.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        Book book = bookDao.buscarLivroPorIsbn(isbn);

        if (book != null) {
            updateBookDetails(request, book);
            bookDao.atualizar(book);
            response.sendRedirect("home");
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Livro não encontrado");
        }
    }

    private void updateBookDetails(HttpServletRequest request, Book book) throws ServletException, IOException {
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
            try {
                int qtd = Integer.parseInt(quantidade);
                if (qtd < 1) {
                    qtd = 1;
                }
                book.setQuantidade(qtd);
            } catch (NumberFormatException e) {
                throw new ServletException("Quantidade deve ser um número válido.", e);
            }
        }

        // Processar o upload da imagem
        Part filePart = request.getPart("imagem");
        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream inputStream = filePart.getInputStream()) {
                byte[] imageBytes = inputStream.readAllBytes();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                book.setImagem(base64Image);
            }
        }
    }
}