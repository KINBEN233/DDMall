package com.kinben233.DDMall.service;
import com.kinben233.DDMall.util.Page;
import com.kinben233.DDMall.pojo.Category;
import java.util.List;
public interface CategoryService {
    List<Category> list();
    void add(Category category);
    void delete(int id);
    Category get(int id);
    void update(Category category);
}
