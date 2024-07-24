package javaweb.javaweb.controllers;

import javaweb.javaweb.dao.BookDao;
import javaweb.javaweb.model.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/editBook")
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
