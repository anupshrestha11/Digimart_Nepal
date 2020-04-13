package com.digimartnepal.digimartnepal.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "testimonial_table")
public class Testimonial {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;

    private String image;

    private String testiment;

    private String profession;

    public Testimonial(String name, String image, String testiment, String profession) {
        this.name = name;
        this.image = image;
        this.testiment = testiment;
        this.profession = profession;
    }
}
