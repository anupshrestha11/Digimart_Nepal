package com.digimartnepal.digimartnepal.controller;

import com.digimartnepal.digimartnepal.model.*;
import com.digimartnepal.digimartnepal.repo.*;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.swing.text.html.Option;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class PageController {
    @Autowired
    PortfolioRepo portfolioRepo;
    @Autowired
    TestimonialRepo testimonialRepo;
    @Autowired
    SliderImageRepo sliderImageRepo;

    @RequestMapping("/")
    public String showPage(ModelMap model) {
        List<Portfolio> portfolios = portfolioRepo.findAll();
        List<Testimonial> testimonials = testimonialRepo.findAll();
        List<SliderImage> sliderImages = sliderImageRepo.findAllByStatus(true);
        model.put("portfolios", portfolios);
        model.put("testimonials", testimonials);
        model.put("sliderimages", sliderImages);
        return "index";
    }

    @Autowired
    BlogPostRepo blogPostRepo;

    @RequestMapping("/blog/{id}")
    public String showBlog(ModelMap model, @PathVariable("id") int id) {
        Optional<BlogPost> optionalBlogPost = blogPostRepo.findById(id);
        if (!optionalBlogPost.isPresent()) {
            return "redirect: /blogs";
        }
        BlogPost blogPost = optionalBlogPost.get();
        List<Comment> comments = new ArrayList<>();
        for (Comment comment : blogPost.getComments()) {
            if (comment.isApproved()) {
                comments.add(comment);
            }
        }
        model.put("comments", comments);
        model.put("blogpost", blogPost);
        return "blog";
    }

    @RequestMapping("/showportfolios")
    public String showPoertfolios(ModelMap modelMap) {
        List<Portfolio> portfolios = portfolioRepo.findAll();
        modelMap.put("portfolios", portfolios);
        return "viewAllPortfolios";
    }

    @RequestMapping("/blog")
    public String viewBlogs(ModelMap modelMap) {
        List<BlogPost> blogPosts = blogPostRepo.findAll();
        Collections.reverse(blogPosts);
        modelMap.put("blogposts", blogPosts);
        return "blogs";
    }

    @RequestMapping("/blogs")
    public String viewBlogss(ModelMap model) {
        return viewBlogs(model);
    }


    @Autowired
    CommentRepo commentRepo;

    @PostMapping("/comment/{id}")
    @ResponseBody
    public String addComment(@PathVariable("id") int id, @RequestParam("comment") String comment, @RequestParam("name") String name, @RequestParam("imageUrl") String imageUrl) {
        Optional<BlogPost> blogPost = blogPostRepo.findById(id);
        Comment comment1 = new Comment();
        comment1.setComment(comment);
        comment1.setName(name);
        comment1.setImageUrl(imageUrl);
        comment1.setBlogPost(blogPost.get());
        comment1.setApproved(false);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        comment1.setPostedDate(sdf.format(date));

        if (blogPost.isPresent()) {
            if (comment1.getComment().isEmpty()) {
                return "Comment can't submit";
            }
            commentRepo.save(comment1);
            return "Your comment has been submitted. Your Comment will be reviewed by Admin, Thanks!!!";
        }
        return "unsuccessfull";
    }

    @RequestMapping("/contactus")
    public String contactUs(){
        return "contactus";
    }

}
