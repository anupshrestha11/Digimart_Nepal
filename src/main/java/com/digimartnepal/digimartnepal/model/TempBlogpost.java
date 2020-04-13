package com.digimartnepal.digimartnepal.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TempBlogpost {
    private int id;
    private String author;
    private String title;
    private String post;
    private MultipartFile bannerImage;
    private String blogDesc;
}
