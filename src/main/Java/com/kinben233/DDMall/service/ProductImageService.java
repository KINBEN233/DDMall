package com.kinben233.DDMall.service;

import java.util.List;

import com.kinben233.DDMall.pojo.ProductImage;

public interface ProductImageService {
    String type_single = "type_single";  //单个图片
    String type_detail = "type_detail";  //详情图片

    void add(ProductImage pi);
    void delete(int id);
    void update(ProductImage pi);
    ProductImage get(int id);
    List list(int pid, String type);
}
