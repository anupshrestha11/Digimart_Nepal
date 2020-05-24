package com.digimartnepal.digimartnepal.repo;

import com.digimartnepal.digimartnepal.model.Comment;
import org.springframework.data.jpa.repository.JpaRepository;


public interface CommentRepo extends JpaRepository<Comment, Integer> {
}
