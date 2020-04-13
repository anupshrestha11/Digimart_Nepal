package com.digimartnepal.digimartnepal.repo;

import com.digimartnepal.digimartnepal.model.BlogPost;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BlogPostRepo extends JpaRepository<BlogPost,Integer> {
}
