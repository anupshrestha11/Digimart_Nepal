package com.digimartnepal.digimartnepal.repo;

import com.digimartnepal.digimartnepal.model.Portfolio;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PortfolioRepo extends JpaRepository<Portfolio, Integer> {
}
