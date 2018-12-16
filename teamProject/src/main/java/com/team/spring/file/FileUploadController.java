package com.team.spring.file;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {
  @Autowired
  FileUploadService fileUploadService;
   
  @RequestMapping( "file/form" )
  public String form() {
    return "form";
  }
   
  @RequestMapping( "file/upload" )
  public String upload(
      Model model,
      @RequestParam("email") String email,
      @RequestParam("file1") MultipartFile file) {
     
    String url = fileUploadService.restore(file);
    model.addAttribute("url", url);
    return "result";
  }
}


