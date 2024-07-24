package com.servlet.aula.projetobibliotecaservlet.service;

import com.servlet.aula.projetobibliotecaservlet.dao.LoggerDao;
import com.servlet.aula.projetobibliotecaservlet.models.Logger;

import java.util.Optional;

public class AuthenticationService {
    private LoggerDao loggerDao;

    public AuthenticationService(LoggerDao loggerDao) {
        this.loggerDao = loggerDao;
    }

    public Logger authenticate(String email, String password) {
        Optional<Logger> optionalLogger = Optional.ofNullable(loggerDao.findByEmail(email));
        return optionalLogger.filter(logger -> logger.getPassword().equals(password)).orElse(null);
    }

    public Logger registerUser(Logger newLogger) {
        Optional<Logger> optionalLogger = Optional.ofNullable(loggerDao.findByEmail(newLogger.getEmail()));
        if (optionalLogger.isPresent()) {
            return null;
        } else {
            loggerDao.cadastrar(newLogger);
            return newLogger;
        }
    }
}