package com.digimartnepal.digimartnepal.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.io.File;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "portfolio_table")
public class Portfolio {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String title;

    private String image;

    private String description;

    public Portfolio(String title, String image, String description){
        this.title=title;
        this.image = image;
        this.description = description;
    }

}
