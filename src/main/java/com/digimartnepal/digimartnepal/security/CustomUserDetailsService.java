package com.digimartnepal.digimartnepal.security;

import com.digimartnepal.digimartnepal.model.Admin;
import com.digimartnepal.digimartnepal.repo.AdminRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private AdminRepo adminRepo;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<Admin> admin = adminRepo.findByUserName(username);

        admin
                .orElseThrow(() -> new UsernameNotFoundException("Username not found"));
        return admin
                .map(CustomUserDetails::new).get();
    }
}