package com.digimartnepal.digimartnepal.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class TempTestimonial {
    private int id;
    private String name;

    private MultipartFile image;

    private String testiment;

    private String profession;
}
