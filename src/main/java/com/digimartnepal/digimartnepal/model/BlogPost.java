package com.digimartnepal.digimartnepal.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "blog_post_table")
public class BlogPost {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String author;

    private String title;

    @Column(length = 100000000)
    private String post;

    @Column(name = "posted_date")
    private String postedDate;

    @Column(name = "added_by")
    private String addedBy;

    @Column(name = "banner_image")
    private String bannerImage;

    @Column(name = "blog_desc")
    private String blogDesc;

    public BlogPost(String author, String title, String post, String bannerImage, String blogDesc) {
        this.author = author;
        this.title = title;
        this.post = post;
        this.bannerImage = bannerImage;
        this.blogDesc = blogDesc;
    }

    @JsonIgnore
    @OneToMany(mappedBy = "blogPost", cascade = {
            CascadeType.DETACH,
            CascadeType.MERGE,
            CascadeType.PERSIST,
            CascadeType.REFRESH
    })
    private List<Comment> comments;

}
