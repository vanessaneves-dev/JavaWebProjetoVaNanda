package javaweb.javaweb.dao;

import javaweb.javaweb.model.Book;
import javaweb.javaweb.util.JPAUtil;
import jakarta.enterprise.context.RequestScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.List;

import static javaweb.javaweb.util.InSessionUtil.inSession;

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
        EntityManager entityManager = JPAUtil.getEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(book);
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

    public void remover(String isbn) {
        EntityManager entityManager = JPAUtil.getEntityManager();
        try {
            entityManager.getTransaction().begin();
            Book book = entityManager.find(Book.class, isbn);
            if (book != null) {
                entityManager.remove(book);
            }
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

    public Book buscarLivroPorIsbn(String isbn) {
        return inSession(entityManagerFactory, entityManager -> {
            return entityManager.find(Book.class, isbn);
        });
    }

    public List<Book> listarLivros() {
        return inSession(entityManagerFactory, entityManager -> {
            return entityManager.createQuery("select b from Book b", Book.class).getResultList();
        });
    }

   /* public void atualizar(Book book) {
        inSession(entityManagerFactory, entityManager -> {
            entityManager.merge(book);
        });
    }*/

   /* public void remover(String isbn) {
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
    public Book buscarLivroPorIsbn(String isbn) {
        return inSession(entityManagerFactory, entityManager -> {
            return entityManager.find(Book.class, isbn);
        });
    }*/
}