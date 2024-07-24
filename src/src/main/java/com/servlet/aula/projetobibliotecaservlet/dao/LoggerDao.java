package com.servlet.aula.projetobibliotecaservlet.dao;

import com.servlet.aula.projetobibliotecaservlet.models.Logger;
import jakarta.enterprise.context.RequestScoped;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Persistence;
import java.util.List;
import static com.servlet.aula.projetobibliotecaservlet.util.InSessionUtil.inSession;

@RequestScoped
public class IsUserDao {
    private EntityManagerFactory factory = Persistence.createEntityManagerFactory("postgres");

    public LoggerDao() {}

    public void cadastrar(Logger logger) {
        inSession(factory, entityManager -> {
            entityManager.persist(logger);
        });
    }

    public void atualizar(String email) {
        inSession(factory, entityManager -> {
            Logger logger = entityManager.find(Logger.class, email);
            if (logger != null) {
                entityManager.merge(logger);
            }
        });
    }

    public void remover(String email) {
        inSession(factory, entityManager -> {
            Logger logger = entityManager.find(Logger.class, email);
            if (logger != null) {
                entityManager.remove(logger);
            }
        });
    }

    public List<Logger> listarUsers() {
        return inSession(factory, entityManager -> {
            return entityManager.createQuery("select u from Logger u", Logger.class).getResultList();
        });
    }

    public Logger findByEmail(String email) {
        return inSession(factory, entityManager -> {
            try {
                return entityManager.createQuery("SELECT l FROM Logger l WHERE l.email = :email", Logger.class)
                        .setParameter("email", email)
                        .getSingleResult();
            } catch (NoResultException e) {
                return null; // Nenhum resultado encontrado, usuário não existe
            }
        });
    }
}
