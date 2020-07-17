package com.kinben233.DDMall.controller;

import com.kinben233.DDMall.pojo.Admin;
import com.kinben233.DDMall.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("")
public class adminLoginController {
    @Autowired
    AdminService adminService;

    @RequestMapping("adminLogin")
    public String alogin(@RequestParam("username") String username, @RequestParam("password") String password,
                         Model model, HttpSession session){
        username = HtmlUtils.htmlEscape(username);
        Admin admin=adminService.get(username,password);
        if (null == admin) {
            model.addAttribute("msg", "账号密码错误");
            return "admin/login";
        }
        session.setAttribute("admin", admin);
        return "redirect:/admin_category_list";
    }

    @RequestMapping("adminLoginPage")
    public String adminLoginPage(Model model){return "admin/login";}

    @RequestMapping("admin_logout")
    public String adminLogout(Model model,HttpSession session){
        session.removeAttribute("admin");
        return "redirect:adminLoginPage";
    }
}
