package com.digimartnepal.digimartnepal.controller;

import com.digimartnepal.digimartnepal.model.*;
import com.digimartnepal.digimartnepal.repo.BlogPostRepo;
import com.digimartnepal.digimartnepal.repo.PortfolioRepo;
import com.digimartnepal.digimartnepal.repo.SliderImageRepo;
import com.digimartnepal.digimartnepal.repo.TestimonialRepo;
import com.digimartnepal.digimartnepal.service.AdminService;
import com.digimartnepal.digimartnepal.service.SliderImageService;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@SessionAttributes("username, error")
public class AdminController {

    @Autowired
    AdminService adminService;

    @RequestMapping("/admin")
    public String redirector() {
        return "redirect:/admin/dashboard";
    }

    @RequestMapping("/login")
    public String showLoginPage() {
        return "AdminPanel/loginpage";
    }

    @RequestMapping("/logout")
    public String logout() {
        return "redirect:/admin/dashboard";
    }

    @Autowired
    private PasswordEncoder bCryptPasswordEncoder;

    private void sessionUsername(ModelMap model) {
        Authentication auth;
        auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        model.put("username", userDetails.getUsername());
    }

    @RequestMapping("/register")
    public String showRegistration() {
        return "AdminPanel/registration";
    }

    @PostMapping("/register")
    public String registerAdmin(@ModelAttribute Admin admin, ModelMap modelMap) {
        Role role = new Role();
        role.setRole("ADMIN");
        Set<Role> roles = new HashSet<>();
        roles.add(role);
        admin.setRoles(roles);
        admin.setPassword(bCryptPasswordEncoder.encode(admin.getPassword()));
        String status = adminService.saveAdmin(admin);
        if (status.equals("failed")) {
            modelMap.addAttribute("status", "Username Already exists");
            return showRegistration();
        }
        return "redirect:/login";
    }

    @Autowired
    SliderImageRepo sliderImageRepo;

    @Autowired
    SliderImageService sliderImageService;

    @PreAuthorize("hasRole('ADMIN')")
    @RequestMapping("/admin/dashboard")
    public String showDashboard(ModelMap modelMap) {
        Authentication auth;
        auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        modelMap.put("username", userDetails.getUsername());
        return "AdminPanel/dashboard";
    }

    @RequestMapping("/admin/manageslider")
    public String showManageSlider(ModelMap model) {
        List<SliderImage> sliderImages = sliderImageRepo.findAll();
        for (SliderImage sliderImage : sliderImages
        ) {
            sliderImage.setLocation("/upload" + File.separator + sliderImage.getName());
        }
        Collections.reverse(sliderImages);
        model.put("sliderImages", sliderImages);
        sessionUsername(model);
        return "AdminPanel/manageslider";
    }

    @RequestMapping("/admin/slider/active/{id}")
    public String slideStatus(@PathVariable("id") int id) {
        SliderImage sliderImage = sliderImageRepo.getOne(id);
        System.out.println(sliderImage.isStatus());
        if (sliderImage.isStatus() == true) {
            sliderImage.setStatus(false);
        } else {
            sliderImage.setStatus(true);
        }
        sliderImageRepo.save(sliderImage);
        return "redirect:/admin/manageslider";
    }

    @PostMapping("/admin/upload") // //new annotation since 4.3
    public String singleFileUpload(@RequestParam("file") MultipartFile[] files, HttpServletRequest request, ModelMap model) throws IOException {
        String path = request.getServletContext().getRealPath("/");
        for (MultipartFile file : files
        ) {
            if (file == null) {
                model.put("error", "File not found");
            }
            sliderImageService.uploadFile(file, path);
        }
        return "redirect:/admin/manageslider";
    }

    @RequestMapping("/admin/slide/delete/{id}")
    public String deleteSlide(@PathVariable("id") int id) {
        sliderImageRepo.deleteById(id);
        return "redirect:/admin/manageslider";
    }

    @RequestMapping("/admin/manageportfolio")
    public String showManagePortfolio(ModelMap model) {
        sessionUsername(model);
        List<Portfolio> portfolios = portfolioRepo.findAll();
        Collections.reverse(portfolios);
        model.put("portfolios", portfolios);
        return "AdminPanel/manageportfolio";
    }

    @Autowired
    PortfolioRepo portfolioRepo;

    @PostMapping("/admin/addportfolio")
    public String addProtfolio(@ModelAttribute TempPortfolio tempPortfolio, ModelMap model, HttpServletRequest request) throws IOException {
        sessionUsername(model);
        String path = request.getServletContext().getRealPath("/");
        Portfolio portfolio = new Portfolio(tempPortfolio.getTitle(), tempPortfolio.getImagefile().getOriginalFilename(), tempPortfolio.getDescription());
        if (tempPortfolio.getImagefile() == null) {
            model.put("error", "upload file");
        } else {
            File files = new File(path + "upload");
            files.mkdir();
            tempPortfolio.getImagefile().transferTo(new File(files.getPath() + File.separator + tempPortfolio.getImagefile().getOriginalFilename()));
            portfolioRepo.save(portfolio);
        }
        return "redirect:/admin/manageportfolio";
    }

    @RequestMapping("/admin/portfolio/{id}")
    @ResponseBody
    public Optional<Portfolio> getportfolio(@PathVariable("id") int id) {
        return portfolioRepo.findById(id);
    }

    @PostMapping("/admin/portfolio/update")
    public String updatePortfolio(@ModelAttribute TempPortfolio tempPortfolio, ModelMap modelMap, HttpServletRequest request) throws IOException {
        Portfolio portfolio = portfolioRepo.getOne(tempPortfolio.getId());
        portfolio.setTitle(tempPortfolio.getTitle());
        portfolio.setDescription(tempPortfolio.getDescription());
        if (!tempPortfolio.getImagefile().isEmpty()) {
            String path = request.getServletContext().getRealPath("/");
            portfolio.setImage(tempPortfolio.getImagefile().getOriginalFilename());
            File files = new File(path + "upload");
            files.mkdir();
            tempPortfolio.getImagefile().transferTo(new File(files.getPath() + File.separator + tempPortfolio.getImagefile().getOriginalFilename()));
        }
        portfolioRepo.save(portfolio);
        return "redirect:/admin/manageportfolio";
    }

    @RequestMapping("/admin/portfolio/delete/{id}")
    public String deletePortfolio(@PathVariable("id") int id) {
        portfolioRepo.deleteById(id);
        return "redirect:/admin/manageportfolio";
    }

    @RequestMapping("/admin/managetestimonial")
    public String showManageTestimonial(ModelMap model) {
        sessionUsername(model);
        List<Testimonial> testimonials = testimonialRepo.findAll();
        Collections.reverse(testimonials);
        model.put("testimonials", testimonials);
        return "AdminPanel/managetestimonial";
    }

    @Autowired
    TestimonialRepo testimonialRepo;

    @PostMapping("/admin/addtestimonial")
    public String addTestimonial(@ModelAttribute TempTestimonial tempTestimonial, ModelMap model, HttpServletRequest request) throws IOException {
        sessionUsername(model);
        String path = request.getServletContext().getRealPath("/");
        Testimonial testimonial = new Testimonial(tempTestimonial.getName(), tempTestimonial.getImage().getOriginalFilename(), tempTestimonial.getTestiment(), tempTestimonial.getProfession());
        if (tempTestimonial.getImage() == null) {
            model.put("error", "upload file");
        } else {
            File files = new File(path + "upload");
            files.mkdir();
            tempTestimonial.getImage().transferTo(new File(files.getPath() + File.separator + tempTestimonial.getImage().getOriginalFilename()));
            testimonialRepo.save(testimonial);
        }
        return "redirect:/admin/managetestimonial";
    }

    @RequestMapping("/admin/testimonial/{id}")
    @ResponseBody
    public Optional<Testimonial> getTestiment(@PathVariable("id") int id) {
        return testimonialRepo.findById(id);
    }

    @PostMapping("/admin/testimonial/update")
    public String updateTestimonal(@ModelAttribute TempTestimonial tempTestimonial, ModelMap modelMap, HttpServletRequest request) throws IOException {
        Testimonial testimonial = testimonialRepo.getOne(tempTestimonial.getId());
        testimonial.setName(tempTestimonial.getName());
        testimonial.setProfession(tempTestimonial.getProfession());
        testimonial.setTestiment(tempTestimonial.getTestiment());
        if (!tempTestimonial.getImage().isEmpty()) {
            String path = request.getServletContext().getRealPath("/");
            testimonial.setImage(tempTestimonial.getImage().getOriginalFilename());
            File files = new File(path + "upload");
            files.mkdir();
            tempTestimonial.getImage().transferTo(new File(files.getPath() + File.separator + tempTestimonial.getImage().getOriginalFilename()));
        }
        testimonialRepo.save(testimonial);
        return "redirect:/admin/managetestimonial";
    }

    @RequestMapping("/admin/testimonial/delete/{id}")
    public String deleteTestimonial(@PathVariable("id") int id) {
        testimonialRepo.deleteById(id);
        return "redirect:/admin/managetestimonial";
    }

    @RequestMapping("/admin/manageblog")
    public String showBlogPost(ModelMap modelMap) {
        List<BlogPost> blogPosts = blogPostRepo.findAll();
        Collections.reverse(blogPosts);
        modelMap.put("blogposts", blogPosts);
        return "AdminPanel/manageblog";
    }

    @RequestMapping("/admin/blogeditor")
    public String showEditor(ModelMap modelMap) {
        modelMap.remove("blogpost");
        return "AdminPanel/blogeditor";
    }

    @PostMapping("/image/upload")
    @SneakyThrows
    public void uploadImage(@RequestPart MultipartFile upload, HttpServletRequest request) throws IOException {
        System.out.println(upload.getOriginalFilename());
        String path = request.getServletContext().getRealPath("/");
        File files = new File(path + "upload");
        files.mkdir();
        upload.transferTo(new File(files.getPath() + File.separator + upload.getOriginalFilename()));
    }

    @GetMapping("/image/browse")
    public String browseImage(ModelMap model, HttpServletRequest request) {
        String path = request.getServletContext().getRealPath("/");
        File folder = new File(path + "upload");
        model.put("fileInfos", folder.listFiles());
        return "AdminPanel/browseimage";
    }

    @Autowired
    BlogPostRepo blogPostRepo;

    @PostMapping("/admin/blog/publish")
    public String publishBlog(@ModelAttribute TempBlogpost tempblogPost, HttpServletRequest request) throws IOException {
        BlogPost blogPost = null;
        if (tempblogPost.getBannerImage().isEmpty()){
                return null;
        }
        else{
            String path = request.getServletContext().getRealPath("/");
            File files = new File(path + "upload");
            files.mkdir();
            tempblogPost.getBannerImage().transferTo(new File(files.getPath() + File.separator + tempblogPost.getBannerImage().getOriginalFilename()));
        }
        blogPost = new BlogPost(tempblogPost.getAuthor(), tempblogPost.getTitle(), tempblogPost.getPost(), tempblogPost.getBannerImage().getOriginalFilename(), tempblogPost.getBlogDesc() );
        blogPost.setAddedBy(((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        blogPost.setPostedDate(sdf.format(date));
        System.out.println(blogPost.toString());
        blogPostRepo.save(blogPost);
        return "redirect:/admin/manageblog";
    }

    @RequestMapping("/admin/blog/delete/{id}")
    public String deleteBlog(@PathVariable("id") int id) {
        blogPostRepo.deleteById(id);
        return "redirect:/admin/manageblog";
    }

    @RequestMapping("/admin/blog/edit/{id}")
    public String editBlog(@PathVariable("id") int id, ModelMap modelMap) {
        BlogPost blogPost = blogPostRepo.getOne(id);
        modelMap.put("blogpost", blogPost);
        return "AdminPanel/updateeditor";
    }

    @RequestMapping("/admin/blog/update")
    public String updateBlog(@ModelAttribute TempBlogpost tempBlogpost, HttpServletRequest request) throws IOException {
        BlogPost blogPost = blogPostRepo.getOne(tempBlogpost.getId());
        blogPost.setTitle(tempBlogpost.getTitle());
        blogPost.setAuthor(tempBlogpost.getAuthor());
        blogPost.setPost(tempBlogpost.getPost());
        blogPost.setBlogDesc(tempBlogpost.getBlogDesc());
        if (!tempBlogpost.getBannerImage().isEmpty()){
            String path = request.getServletContext().getRealPath("/");
            File files = new File(path + "upload");
            files.mkdir();
            tempBlogpost.getBannerImage().transferTo(new File(files.getPath() + File.separator + tempBlogpost.getBannerImage().getOriginalFilename()));
            blogPost.setBannerImage(tempBlogpost.getBannerImage().getOriginalFilename());
        }
        blogPost.setAddedBy(((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        blogPost.setPostedDate(sdf.format(date));
        blogPostRepo.save(blogPost);
        return "redirect:/admin/manageblog";

    }

}
