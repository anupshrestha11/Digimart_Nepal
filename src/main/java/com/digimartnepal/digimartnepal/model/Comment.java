package com.digimartnepal.digimartnepal.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "comment_table")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String comment;

    private String name;

    private boolean isApproved;

    @Column(name = "user_image_url")
    private String imageUrl;

    @Column(name = "posted_date")
    private String postedDate;

    @ManyToOne(cascade = {
            CascadeType.DETACH,
            CascadeType.MERGE,
            CascadeType.PERSIST,
            CascadeType.REFRESH
    })
    @JoinColumn(name = "blog_post_id")
    private BlogPost blogPost;
}
