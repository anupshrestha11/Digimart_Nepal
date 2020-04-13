package com.digimartnepal.digimartnepal.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TempPortfolio {
    private int id;

    private String title;
    private MultipartFile imagefile;
    private String description;
}
