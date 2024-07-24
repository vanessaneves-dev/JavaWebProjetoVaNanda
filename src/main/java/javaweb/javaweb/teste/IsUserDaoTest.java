package javaweb.javaweb.teste;

import javaweb.javaweb.dao.IsUserDao;
import javaweb.javaweb.model.IsUser;
import javaweb.javaweb.util.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import org.junit.jupiter.api.*;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

public class IsUserDaoTest {

    private static EntityManager em;
    private IsUserDao isUserDao;

    @BeforeAll
    public static void setUpClass() {
        em = JPAUtil.getEntityManager();
    }

    @BeforeEach
    public void setUp() {
        EntityTransaction transaction = em.getTransaction();
        if (!transaction.isActive()) {
            transaction.begin();
        }
        isUserDao = new IsUserDao(); // Sem argumentos
    }

    @AfterEach
    public void tearDown() {
        EntityTransaction transaction = em.getTransaction();
        if (transaction.isActive()) {
            transaction.commit();
        }
    }

    @AfterAll
    public static void tearDownClass() {
        if (em != null) {
            em.close();
        }
    }

    @Test
    public void testFindByEmail() {
        IsUser isUser = new IsUser("Test User", "test@example.com", "password");
        isUserDao.cadastrar(isUser);

        IsUser foundIsUser = isUserDao.findByEmail("test@example.com");
        assertNotNull(foundIsUser);
        assertEquals("Test User", foundIsUser.getNome());
    }
}