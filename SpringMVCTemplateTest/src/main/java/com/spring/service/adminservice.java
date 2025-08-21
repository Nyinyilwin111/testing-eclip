package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.spring.model.adminbean;
import com.spring.repository.adminrepo;

@Service
public class adminservice {

    @Autowired
    private adminrepo repo;

    public int registerAdmin(adminbean admin) {
        // Hash password before saving
        String hashed = BCrypt.hashpw(admin.getPassword(), BCrypt.gensalt());
        admin.setPassword(hashed);

        return repo.insertadmin(admin);
    }
}
