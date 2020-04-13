package com.digimartnepal.digimartnepal.repo;

import com.digimartnepal.digimartnepal.model.SliderImage;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SliderImageRepo extends JpaRepository<SliderImage, Integer> {
    List<SliderImage> findAllByStatus(boolean status);
}
