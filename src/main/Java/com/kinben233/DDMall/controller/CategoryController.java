package com.kinben233.DDMall.controller;
import com.github.pagehelper.PageInfo;
import com.kinben233.DDMall.pojo.Category;
import com.github.pagehelper.PageHelper;
import com.kinben233.DDMall.pojo.Product;
import com.kinben233.DDMall.service.ProductService;
import com.kinben233.DDMall.util.Page;
import com.kinben233.DDMall.util.ImageUtil;
import com.kinben233.DDMall.service.CategoryService;
import com.kinben233.DDMall.util.UploadedImageFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.List;

@Controller
@RequestMapping("")
public class CategoryController {
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductService productService;

    @RequestMapping("admin_category_list")
    public String list(Model model,Page page){
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Category> cs= categoryService.list();
        int total = (int) new PageInfo<>(cs).getTotal();
        page.setTotal(total);
        model.addAttribute("cs", cs);
        model.addAttribute("page", page);
        return "admin/listCategory";
    }

    @RequestMapping("admin_category_add")
    public String add(Category c, HttpSession session, UploadedImageFile uploadedImageFile) throws IOException{
        System.out.println(c.getId());
        c.setStatus("exist");
        categoryService.add(c);
        System.out.println(c.getId());
        File  imageFolder= new File(session.getServletContext().getRealPath("img/category"));
        File file = new File(imageFolder,c.getId()+".jpg");
        if(!file.getParentFile().exists())
            file.getParentFile().mkdirs();
        System.out.println(uploadedImageFile);
        System.out.println(uploadedImageFile.getImage());
        System.out.println(file);
        uploadedImageFile.getImage().transferTo(file);
        BufferedImage img = ImageUtil.change2jpg(file);
        ImageIO.write(img, "jpg", file);
        return "redirect:/admin_category_list";
    }

    @RequestMapping("admin_category_delete")
    public String delete(int id,int start,HttpSession session) throws IOException {
       try {
           List cs=productService.list(id);
           if(null!=cs.get(0))
               return "redirect:/admin_category_delete_fail?start=" + start;
           else {
               categoryService.delete(id);
               File imageFolder = new File(session.getServletContext().getRealPath("img/category"));
               File file = new File(imageFolder, id + ".jpg");
               file.delete();
               return "redirect:/admin_category_list";
           }
       }
        catch (Exception e) {
            return "redirect:/admin_category_delete_fail?start=" + start;
        }
    }

    @RequestMapping("admin_category_edit")
    public String edit(int id,Model model) throws IOException {
        Category c= categoryService.get(id);
        if(null!=c.getStatus()&&c.getStatus().equals("delete")) {
            return "admin/fail/categoryEditFail";
        }
        else {
            model.addAttribute("c", c);
            return "admin/editCategory";
        }
    }

    @RequestMapping("admin_category_update")
    public String update(Category c, HttpSession session, UploadedImageFile uploadedImageFile) throws IOException {
        categoryService.update(c);
        MultipartFile image = uploadedImageFile.getImage();
        if(null!=image &&!image.isEmpty()){
            File  imageFolder= new File(session.getServletContext().getRealPath("img/category"));
            File file = new File(imageFolder,c.getId()+".jpg");
            image.transferTo(file);
            BufferedImage img = ImageUtil.change2jpg(file);
            ImageIO.write(img, "jpg", file);
        }
        return "redirect:/admin_category_list";
    }

    @RequestMapping("admin_category_delete_fail")
    public String cfail(Model model,int start){
        model.addAttribute("start",start);
        return "admin/fail/categoryDeleteFail";
    }
}
