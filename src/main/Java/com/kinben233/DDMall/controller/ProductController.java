package com.kinben233.DDMall.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kinben233.DDMall.pojo.Category;
import com.kinben233.DDMall.pojo.Product;
import com.kinben233.DDMall.service.CategoryService;
import com.kinben233.DDMall.service.ProductService;
import com.kinben233.DDMall.util.Page;

import javax.jws.WebParam;

@Controller
@RequestMapping("")
public class ProductController {
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductService productService;

    @RequestMapping("admin_product_list")
    public String list(int cid,Model model,Page page){
        Category c = categoryService.get(cid);
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Product> ps = productService.list(cid);
        int total = (int) new PageInfo<> (ps).getTotal();
        page.setTotal(total);
        page.setParam("&cid="+c.getId());
        model.addAttribute("ps", ps);
        model.addAttribute("c", c);
        model.addAttribute("page", page);
        return "admin/listProduct";
    }

    @RequestMapping("admin_product_add")
    public String add(Model model,Product p){
        p.setCreateDate(new Date());
        p.setStatus("exist");
        productService.add(p);
        return "redirect:admin_product_list?cid="+p.getCid();
    }

    @RequestMapping("admin_product_delete")
    public String delete(int id){
        try {
            Product p = productService.get(id);
            productService.delete(id);
            return "redirect:admin_product_list?cid=" + p.getCid();
        }
        catch (Exception e){
            Product p = productService.get(id);
            return "redirect:admin_product_delete_fail?cid="+p.getCid();
        }
    }

    @RequestMapping("admin_product_edit")
    public String edit(Model model, int id) {
        Product p = productService.get(id);
        if(null!=p.getStatus()&&p.getStatus().equals("delete")){
            model.addAttribute("cid",p.getCid());
            return "admin/fail/productEditFail";
        }
        else {
            Category c = categoryService.get(p.getCid());
            p.setCategory(c);
            model.addAttribute("p", p);
            return "admin/editProduct";
        }
    }

    @RequestMapping("admin_product_update")
    public String update(Product p) {
        productService.update(p);
        return "redirect:admin_product_list?cid="+p.getCid();
    }

    @RequestMapping("admin_product_delete_fail")
    public String pdfail(Model model,int cid) {
        model.addAttribute("cid",cid);
        return "admin/fail/productDeleteFail";
    }
}
