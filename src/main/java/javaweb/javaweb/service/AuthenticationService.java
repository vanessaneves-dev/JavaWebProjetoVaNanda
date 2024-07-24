package javaweb.javaweb.service;

import javaweb.javaweb.dao.IsUserDao;
import javaweb.javaweb.model.IsUser;

import java.util.Optional;

public class AuthenticationService {
    private IsUserDao isUserDao;

    public AuthenticationService(IsUserDao isUserDao) {
        this.isUserDao = isUserDao;
    }

    public IsUser authenticate(String email, String password) {
        Optional<IsUser> optionalLogger = Optional.ofNullable(isUserDao.findByEmail(email));
        return optionalLogger.filter(logger -> logger.getPassword().equals(password)).orElse(null);
    }

    public IsUser registerUser(IsUser newIsUser) {
        Optional<IsUser> optionalLogger = Optional.ofNullable(isUserDao.findByEmail(newIsUser.getEmail()));
        if (optionalLogger.isPresent()) {
            return null;
        } else {
            isUserDao.cadastrar(newIsUser);
            return newIsUser;
        }
    }
}