package com.digimartnepal.digimartnepal.controller;

import com.digimartnepal.digimartnepal.model.*;
import com.digimartnepal.digimartnepal.repo.BlogPostRepo;
import com.digimartnepal.digimartnepal.repo.PortfolioRepo;
import com.digimartnepal.digimartnepal.repo.SliderImageRepo;
import com.digimartnepal.digimartnepal.repo.TestimonialRepo;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

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
        BlogPost blogPost = blogPostRepo.getOne(id);
        model.put("comments", blogPost.getComments());
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


}
