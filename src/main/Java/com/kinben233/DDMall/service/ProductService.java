package com.kinben233.DDMall.service;

import java.util.List;
import com.kinben233.DDMall.pojo.Category;
import com.kinben233.DDMall.pojo.Product;

public interface ProductService {
    void add(Product p);
    void delete(int id);
    void update(Product p);
    Product get(int id);
    List list(int cid);
    void setFirstProductImage(Product p);
    //前端使用
    //为多个分类填充产品集合
    void fill(List<Category> cs);
    //为分类填充产品集合
    void fill(Category c);
    //为多个分类填充推荐产品集合，即把分类下的产品集合，按照8个为一行，拆成多行，以利于后续页面上进行显示
    void fillByRow(List<Category> cs);
    void setSaleAndReviewNumber(Product p);

    void setSaleAndReviewNumber(List<Product> ps);

    List<Product> search(String keyword);
}
