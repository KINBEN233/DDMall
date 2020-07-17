package com.kinben233.DDMall.controller;
import com.kinben233.DDMall.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("")
public class PageController {
    @RequestMapping("registerPage")    //注册界面
    public String registerPage() {
        return "fore/register";
    }

    @RequestMapping("registerSuccessPage")  //注册成功界面
    public String registerSuccessPage() {
        return "fore/registerSuccess";
    }

    @RequestMapping("loginPage")   //登录界面
    public String loginPage() {
        return "fore/login";
    }

    @RequestMapping("forealipay")  //付款界面
    public String alipay(){
        return "fore/alipay";
    }

    @RequestMapping("foreabout")   //关于DD页面
    public String about(Model model) {
        return "fore/aboutDD";
    }

    @RequestMapping("foreDDZhanShou")
    public String ZhanShou(Model model){return "fore/DDZhanShou";}

    @RequestMapping("forebuyFail")   //如果库存不足或商品已下架，则结算失败，跳转页面显示错误信息
    public String buyFail(Model model, HttpSession session){
        model.addAttribute("kucunbuzu",session.getAttribute("kucunbuzu"));
        model.addAttribute("xiajia",session.getAttribute("xiajia"));
        return "fore/fail/buyFail";
    }

    @RequestMapping("forechangePasswordPage")
    public String changeP(Model model,HttpSession session){
        User user=(User) session.getAttribute("user");
        model.addAttribute("user",user);
        return "fore/changePassword";
    }
}
