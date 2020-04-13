package com.digimartnepal.digimartnepal.service;

import com.digimartnepal.digimartnepal.model.SliderImage;
import com.digimartnepal.digimartnepal.repo.SliderImageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class SliderImageService {
@Autowired
    SliderImageRepo sliderImageRepo;
    public void uploadFile(MultipartFile file, String path)throws IllegalStateException, IOException {
        File files = new File(path+"upload");
        files.mkdir();
        file.transferTo(new File(files.getPath()+File.separator+file.getOriginalFilename()));
        SliderImage sliderImage = new SliderImage();
        sliderImage.setName(file.getOriginalFilename());
        sliderImage.setUploadedBy( ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername());
        sliderImage.setLocation(new File(files.getPath()+File.separator+file.getOriginalFilename()).getPath());
        sliderImageRepo.save(sliderImage);
    }

}
