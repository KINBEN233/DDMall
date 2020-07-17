package com.kinben233.DDMall.service;

import com.kinben233.DDMall.pojo.Product;
import com.kinben233.DDMall.pojo.PropertyValue;

import java.util.List;

public interface PropertyValueService {
    void init(Product p);
    void update(PropertyValue pv);

    PropertyValue get(int ptid, int pid);
    List<PropertyValue> list(int pid);
}
