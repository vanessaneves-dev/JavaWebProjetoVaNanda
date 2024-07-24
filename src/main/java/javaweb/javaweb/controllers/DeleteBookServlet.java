package javaweb.javaweb.controllers;

import javaweb.javaweb.dao.BookDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteBookAction")
public class DeleteBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookDao bookDao;

    @Override
    public void init() {
        this.bookDao = new BookDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        if (isbn != null) {
            bookDao.remover(isbn);
            response.sendRedirect("home");
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ISBN não fornecido");
        }
    }
}
