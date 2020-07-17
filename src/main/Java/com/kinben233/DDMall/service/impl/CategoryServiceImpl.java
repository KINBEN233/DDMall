package com.kinben233.DDMall.service.impl;
import com.github.pagehelper.PageInfo;
import com.kinben233.DDMall.pojo.Product;
import com.kinben233.DDMall.pojo.Property;
import com.kinben233.DDMall.service.ProductService;
import com.kinben233.DDMall.service.PropertyService;
import com.kinben233.DDMall.util.Page;
import com.kinben233.DDMall.mapper.CategoryMapper;
import com.kinben233.DDMall.pojo.CategoryExample;
import com.kinben233.DDMall.pojo.Category;
import com.kinben233.DDMall.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService{
    @Autowired
    CategoryMapper categoryMapper;

    @Override
    public List<Category> list() {
        CategoryExample example =new CategoryExample();
        example.createCriteria().andStatusIsNotNull().andStatusNotEqualTo("delete");
        example.setOrderByClause("id desc");
        return categoryMapper.selectByExample(example);
    }

    @Override
    public void add(Category category) {
        categoryMapper.insert(category);
    }

    @Override
    public void delete(int id) {
        Category category=categoryMapper.selectByPrimaryKey(id);
        category.setStatus("delete");
        categoryMapper.updateByPrimaryKeySelective(category);
    }

    @Override
    public Category get(int id) {
        return categoryMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(Category category) {
        categoryMapper.updateByPrimaryKeySelective(category);
    }
}
