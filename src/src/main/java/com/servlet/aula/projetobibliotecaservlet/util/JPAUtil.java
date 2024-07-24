package com.servlet.aula.projetobibliotecaservlet.util;


import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAUtil {

    private static final EntityManagerFactory FACTORY = Persistence
            .createEntityManagerFactory("postgres");

    public static EntityManager getEntityManager() {
        return FACTORY.createEntityManager();
    }

}