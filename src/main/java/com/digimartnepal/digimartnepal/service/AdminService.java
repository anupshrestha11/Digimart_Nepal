package com.digimartnepal.digimartnepal.service;

import com.digimartnepal.digimartnepal.model.Admin;
import com.digimartnepal.digimartnepal.repo.AdminRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AdminService {

    @Autowired
    AdminRepo adminRepo;

    public String saveAdmin(Admin admin) {
        if (checkExistingAdmin(admin)) {
            adminRepo.save(admin);
            return "success";
        }
        return "failed";
    }

    public boolean checkExistingAdmin(Admin admin) {
        System.out.println(admin.getUserName());
        if (!adminRepo.findByUserName(admin.getUserName()).isPresent()) {
            return true;
        }
        return false;
    }

    public Admin checkAdmin(String userName, String password) {
        Optional<Admin> admin = adminRepo.findByUserName(userName);
        if (admin.isPresent() && admin.get().getPassword().equals(password)) {
            return admin.get();
        }
        return null;
    }
}