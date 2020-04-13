package com.digimartnepal.digimartnepal.repo;

import com.digimartnepal.digimartnepal.model.Testimonial;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TestimonialRepo extends JpaRepository<Testimonial, Integer> {
}
