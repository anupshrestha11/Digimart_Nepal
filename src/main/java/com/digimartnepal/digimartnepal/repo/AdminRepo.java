package com.digimartnepal.digimartnepal.repo;

import com.digimartnepal.digimartnepal.model.Admin;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;


public interface AdminRepo extends JpaRepository<Admin,Integer> {
    Optional<Admin> findByUserName(String userName);
}
