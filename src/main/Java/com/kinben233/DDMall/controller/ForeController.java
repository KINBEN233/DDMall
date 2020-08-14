package com.kinben233.DDMall.controller;

import com.github.pagehelper.PageHelper;
import com.kinben233.DDMall.pojo.*;
import com.kinben233.DDMall.service.*;
import comparator.*;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Parameter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("")
public class ForeController {
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductService productService;
    @Autowired
    UserService userService;
    @Autowired
    ProductImageService productImageService;
    @Autowired
    PropertyValueService propertyValueService;
    @Autowired
    OrderService orderService;
    @Autowired
    OrderItemService orderItemService;
    @Autowired
    ReviewService reviewService;

    @RequestMapping("forehome")   //主页
    public String home(Model model) {
        List<Category> cs = categoryService.list();
        productService.fill(cs);
        productService.fillByRow(cs);
        model.addAttribute("cs", cs);
        model.addAttribute("categorycount",cs.size());
        return "fore/home";
    }

    @RequestMapping("foreregister")   //注册
    public String register(Model model, User user) {
        String name = user.getName();
        name = HtmlUtils.htmlEscape(name);
        user.setName(name);
        boolean exist = userService.isExist(name);
        if (exist) {
            String m = "用户名已经被使用,不能使用";
            model.addAttribute("msg", m);
            model.addAttribute("user", null);
            return "fore/register";
        }
        userService.add(user);
        return "redirect:registerSuccessPage";
    }

    @RequestMapping("forecheckLogin")   //Ajax检查登录状态
    @ResponseBody
    public String checkLogin( HttpSession session) {
        User user =(User)  session.getAttribute("user");
        if(null!=user)
            return "success";
        return "fail";
    }

    @RequestMapping("foreloginAjax")   //模拟窗口登录
    @ResponseBody
    public String loginAjax(@RequestParam("name") String name, @RequestParam("password") String password,HttpSession session) {
        name = HtmlUtils.htmlEscape(name);
        User user = userService.get(name,password);

        if(null==user){
            return "fail";
        }
        session.setAttribute("user", user);
        return "success";
    }

    @RequestMapping("forelogin")   //登录
    public String login(@RequestParam("name") String name, @RequestParam("password") String password, Model model, HttpSession session) {
        name = HtmlUtils.htmlEscape(name);
        User user = userService.get(name, password);

        if (null == user) {
            model.addAttribute("msg", "账号密码错误");
            return "fore/login";
        }
        session.setAttribute("user", user);
        return "redirect:forehome";
    }

    @RequestMapping("forelogout")   //退出账号
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:forehome";
    }

    @RequestMapping("foreproduct")   //产品详情页
    public String product(int pid,String buy, Model model) {
        try {
            Product p = productService.get(pid);
            if (null != p.getStatus() && p.getStatus().equals("delete")) {
                return "fore/fail/productNotExist";
            } else {
                List<ProductImage> productSingleImages = productImageService.list(p.getId(), ProductImageService.type_single);
                List<ProductImage> productDetailImages = productImageService.list(p.getId(), ProductImageService.type_detail);
                p.setProductSingleImages(productSingleImages);
                p.setProductDetailImages(productDetailImages);
                List<PropertyValue> pvs = propertyValueService.list(p.getId());
                List<Review> reviews = reviewService.list(p.getId());
                productService.setSaleAndReviewNumber(p);
                model.addAttribute("reviews", reviews);
                model.addAttribute("p", p);
                model.addAttribute("pvs", pvs);
                if(buy=="false")
                    model.addAttribute("msg","库存不足");
                return "fore/product";
            }
        }catch (Exception e){
            return "fore/fail/productNotExist";
        }

    }

    @RequestMapping("forecategory")  //分类页
    public String category(int cid, String sort, Model model) {
        try {
            Category c = categoryService.get(cid);
            if(null!=c.getStatus()&&c.getStatus().equals("delete"))
                return "fore/fail/productNotExist";
            else {
                productService.fill(c);
                productService.setSaleAndReviewNumber(c.getProducts());

                if (null != sort) {          //排序
                    switch (sort) {
                        case "review":
                            Collections.sort(c.getProducts(), new ProductReviewComparator());
                            break;
                        case "date":
                            Collections.sort(c.getProducts(), new ProductDateComparator());
                            break;

                        case "saleCount":
                            Collections.sort(c.getProducts(), new ProductSaleCountComparator());
                            break;

                        case "price":
                            Collections.sort(c.getProducts(), new ProductPriceComparator());
                            break;

                        case "all":
                            Collections.sort(c.getProducts(), new ProductAllComparator());
                            break;
                    }
                }

                model.addAttribute("c", c);
                return "fore/category";
            }
        }
        catch (Exception e){
            return "fore/fail/productNotExist";
        }
    }

    @RequestMapping("foresearch")   //搜索页
    public String search(String keyword, Model model) {
        PageHelper.offsetPage(0, 20);
        List<Product> ps_ = productService.search(keyword);
        List<Product> ps=new ArrayList<>();
        for(Product p :ps_){
            if(null==p.getStatus())
                ps.add(p);
            else if(null!=p.getStatus()&&!p.getStatus().equals("delete"))
                ps.add(p);
        }
        productService.setSaleAndReviewNumber(ps);
        model.addAttribute("ps", ps);
        return "fore/searchResult";
    }

    @RequestMapping("forebuyone")   //立即购买
    public String buyone(int pid, int num, HttpSession session) {
        Product p = productService.get(pid);
        int oiid = 0;

        User user =(User)  session.getAttribute("user");
        boolean found = false;
        List<OrderItem> ois = orderItemService.listByUser(user.getId());
        for (OrderItem oi : ois) {
            if(oi.getProduct().getId().intValue()==p.getId().intValue()){
                if(oi.getNumber()+num>p.getStock()){
                    return "redirect:foreproduct?pid="+pid+"&buy=false";
                }
                else {
                    oi.setNumber(oi.getNumber() + num);
                    orderItemService.update(oi);
                    found = true;
                    oiid = oi.getId();
                    break;
                }
            }
        }

        if(!found){
            OrderItem oi = new OrderItem();
            oi.setUid(user.getId());
            oi.setNumber(num);
            oi.setPid(pid);
            orderItemService.add(oi);
            oiid = oi.getId();
        }
        return "redirect:forebuy?oiid="+oiid;
    }

    @RequestMapping("forebuy")   //结算页面
    public String buy( Model model,String[] oiid,HttpSession session){
        List<OrderItem> ois = new ArrayList<>();
        List<Product> xiajia=new ArrayList<>();
        List<Product> kucunbuzu=new ArrayList<>();
        float total = 0;
        for (String strid : oiid) {
            int id = Integer.parseInt(strid);
            OrderItem oi= orderItemService.get(id);
            Product p=productService.get(oi.getPid());
            if(null!=p.getStatus()&&p.getStatus().equals("delete")) {
                xiajia.add(p);
            }
            else if(p.getStock()<oi.getNumber()){
                kucunbuzu.add(p);
            }
            else {
                total += oi.getProduct().getPromotePrice() * oi.getNumber();
                ois.add(oi);
            }
        }
        if(xiajia.size()!=0||kucunbuzu.size()!=0) {
            if (xiajia.size() != 0) {
                session.setAttribute("xiajia",xiajia);
            }
            if (kucunbuzu.size() != 0) {
                session.setAttribute("kucunbuzu",kucunbuzu);
            }
            return "redirect:forebuyFail";
        }
        else {
            session.setAttribute("ois", ois);
            model.addAttribute("total", total);
            return "fore/buy";
        }
    }

    @RequestMapping("foreaddCart")   //加入购物车
    @ResponseBody
    public String addCart(int pid, int num, Model model,HttpSession session) {
        Product p = productService.get(pid);
        User user =(User)  session.getAttribute("user");
        boolean found = false;

        List<OrderItem> ois = orderItemService.listByUser(user.getId());
        for (OrderItem oi : ois) {
            if(oi.getProduct().getId().intValue()==p.getId().intValue()){
                oi.setNumber(oi.getNumber()+num);
                orderItemService.update(oi);
                found = true;
                break;
            }
        }

        if(!found){
            OrderItem oi = new OrderItem();
            oi.setUid(user.getId());
            oi.setNumber(num);
            oi.setPid(pid);
            orderItemService.add(oi);
        }
        return "success";
    }

    @RequestMapping("forecart")  //购物车界面
    public String cart( Model model,HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<OrderItem> ois = orderItemService.listByUser(user.getId());
        model.addAttribute("ois", ois);
        return "fore/cart";
    }

    @RequestMapping("forechangeOrderItem")
    @ResponseBody
    public String changeOrderItem( Model model,HttpSession session, int pid, int number) {
        User user =(User)  session.getAttribute("user");
        if(null==user)
            return "fail";

        List<OrderItem> ois = orderItemService.listByUser(user.getId());
        for (OrderItem oi : ois) {
            if(oi.getProduct().getId().intValue()==pid){
                oi.setNumber(number);
                orderItemService.update(oi);
                break;
            }

        }
        return "success";
    }

    @RequestMapping("foredeleteOrderItem")
    @ResponseBody
    public String deleteOrderItem( Model model,HttpSession session,int oiid){
        User user =(User)  session.getAttribute("user");
        if(null==user)
            return "fail";
        orderItemService.delete(oiid);
        return "success";
    }

    @RequestMapping("forecreateOrder")   //前端提交订单消息与收货地址信息后创建订单
    @Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
    public String createOrder( Model model,Order order,HttpSession session) {  //order包含了地址信息
        User user = (User) session.getAttribute("user");
        String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + RandomUtils.nextInt(10000);
        order.setOrderCode(orderCode);
        order.setCreateDate(new Date());
        order.setUid(user.getId());
        order.setStatus(OrderService.waitPay);
        List<OrderItem> ois = (List<OrderItem>) session.getAttribute("ois");
        List<Product> kucunbuzu = new ArrayList<>();
        boolean flag = false;
        for (OrderItem oi : ois) {
            Product p = productService.get(oi.getPid());
            if (p.getStock() - oi.getNumber() < 0) {
                kucunbuzu.add(p);
                flag = true;
            } else {
                p.setStock(p.getStock() - oi.getNumber());
                productService.update(p);
            }
        }
        try {
            if (flag == true) {
                throw new RuntimeException();
            }
            float total = orderService.add(order, ois);
            return "redirect:forealipay?oid=" + order.getId() + "&total=" + total;
        } catch (Exception e) {
            session.setAttribute("kucunbuzu", kucunbuzu);
            return "redirect:forebuyFail";
        }
    }

    @RequestMapping("forepayed")   //付款成功页
    public String payed(int oid, float total, Model model) {
        Order order = orderService.get(oid);
        order.setStatus(OrderService.waitDelivery);
        order.setPayDate(new Date());
        orderService.update(order);  //付款成功后更新数据库的订单信息
        Calendar c = Calendar.getInstance();
        Date now = c.getTime();
        c.setTime(now);
        c.add(Calendar.DATE,3);
        SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日");
        model.addAttribute("o", order);  //将订单信息传到payed页面
        model.addAttribute("Date",sdf.format(c.getTime()));
        return "fore/payed";
    }

    @RequestMapping("forebought")   //订单页
    public String bought( Model model,HttpSession session) {
        User user =(User)  session.getAttribute("user");
        //返回没有被删除的订单的集合
        List<Order> os= orderService.list(user.getId(),OrderService.delete);

        orderItemService.fill(os);

        model.addAttribute("os", os);

        return "fore/bought";
    }

    @RequestMapping("foreconfirmPay")
    public String confirmPay( Model model,int oid) {
        Order o = orderService.get(oid);
        orderItemService.fill(o);
        model.addAttribute("o", o);
        return "fore/confirmPay";
    }

    @RequestMapping("foreorderConfirmed")
    public String orderConfirmed( Model model,int oid) {
        Order o = orderService.get(oid);
        o.setStatus(OrderService.waitReview);
        o.setConfirmDate(new Date());
        orderService.update(o);
        return "fore/orderConfirmed";
    }

    @RequestMapping("foredeleteOrder")
    @ResponseBody
    public String deleteOrder( Model model,int oid){
        Order o = orderService.get(oid);
        o.setStatus(OrderService.delete);
        orderService.update(o);
        return "success";
    }

    @RequestMapping("forereview")
    public String review( Model model,int oid) {
        Order o = orderService.get(oid);
        orderItemService.fill(o);
        Product p = o.getOrderItems().get(0).getProduct();
        List<Review> reviews = reviewService.list(p.getId());
        productService.setSaleAndReviewNumber(p);
        model.addAttribute("p", p);
        model.addAttribute("o", o);
        model.addAttribute("reviews", reviews);
        return "fore/review";
    }

    @RequestMapping("foredoreview")
    public String doreview( Model model,HttpSession session,@RequestParam("oid") int oid,@RequestParam("pid") int pid,String content) {
        Order o = orderService.get(oid);
        o.setStatus(OrderService.finish);
        orderService.update(o);

        Product p = productService.get(pid);
        content = HtmlUtils.htmlEscape(content);

        User user =(User)  session.getAttribute("user");
        Review review = new Review();
        review.setContent(content);
        review.setPid(pid);
        review.setCreateDate(new Date());
        review.setUid(user.getId());
        reviewService.add(review);

        return "redirect:forereview?oid="+oid+"&showonly=true";
    }

    @RequestMapping("foreUserInfo")
    public String userinfo(Model model,HttpSession session){
        User user=(User) session.getAttribute("user");
        List<Order> os=orderService.list(user.getId());
        orderItemService.fill(os);
        float total=0;
        for(Order o : os){
            total+=o.getTotal();
        }
        model.addAttribute("total",total);
        model.addAttribute("username",user.getName());
        return "fore/UserInfo";
    }

    @RequestMapping("foreChangePassword")
    @ResponseBody
    public String change(User user){
        userService.update(user);
        return "success";
    }
}


