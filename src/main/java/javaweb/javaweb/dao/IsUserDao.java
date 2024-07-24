package javaweb.javaweb.dao;

import javaweb.javaweb.model.IsUser;
import jakarta.enterprise.context.RequestScoped;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Persistence;
import java.util.List;
import static javaweb.javaweb.util.InSessionUtil.inSession;

@RequestScoped
public class IsUserDao {
    private EntityManagerFactory factory = Persistence.createEntityManagerFactory("postgres");

    public IsUserDao() {}

    public void cadastrar(IsUser logger) {
        inSession(factory, entityManager -> {
            entityManager.persist(logger);
        });
    }

    public void atualizar(String email) {
        inSession(factory, entityManager -> {
            IsUser logger = entityManager.find(IsUser.class, email);
            if (logger != null) {
                entityManager.merge(logger);
            }
        });
    }

    public void remover(String email) {
        inSession(factory, entityManager -> {
            IsUser logger = entityManager.find(IsUser.class, email);
            if (logger != null) {
                entityManager.remove(logger);
            }
        });
    }

    public List<IsUser> listarUsers() {
        return inSession(factory, entityManager -> {
            return entityManager.createQuery("select u from IsUser u", IsUser.class).getResultList();
        });
    }

    public IsUser findByEmail(String email) {
        return inSession(factory, entityManager -> {
            try {
                return entityManager.createQuery("SELECT l FROM IsUser l WHERE l.email = :email", IsUser.class)
                        .setParameter("email", email)
                        .getSingleResult();
            } catch (NoResultException e) {
                return null; // Nenhum resultado encontrado, usuário não existe
            }
        });
    }
}
