package com.servlet.aula.projetobibliotecaservlet.dao;

import com.servlet.aula.projetobibliotecaservlet.models.Book;
import com.servlet.aula.projetobibliotecaservlet.util.JPAUtil;
import jakarta.enterprise.context.RequestScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.List;

import static com.servlet.aula.projetobibliotecaservlet.util.InSessionUtil.inSession;

@RequestScoped
public class BookDao {
    private EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("postgres");

    public void cadastrar(Book book) {
        EntityManager entityManager = JPAUtil.getEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(book);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            throw e;
        } finally {
            entityManager.close();
        }
    }

    public void atualizar(Book book) {
        inSession(entityManagerFactory, entityManager -> {
            entityManager.merge(book);
        });
    }

    public void remover(String isbn) {
        inSession(entityManagerFactory, entityManager -> {
            Book book = entityManager.find(Book.class, isbn);
            if (book != null) {
                entityManager.remove(book);
            }
        });
    }

    public List<Book> listarLivros() {
        return inSession(entityManagerFactory, entityManager -> {
            return entityManager.createQuery("select b from Book b", Book.class).getResultList();
        });
    }
}