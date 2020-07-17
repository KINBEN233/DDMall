package com.kinben233.DDMall.service.impl;

import com.kinben233.DDMall.mapper.PropertyMapper;
import com.kinben233.DDMall.pojo.Property;
import com.kinben233.DDMall.pojo.Category;
import com.kinben233.DDMall.pojo.Product;
import com.kinben233.DDMall.pojo.PropertyExample;
import com.kinben233.DDMall.service.CategoryService;
import com.kinben233.DDMall.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PropertyServiceImpl implements PropertyService{
    @Autowired
    PropertyMapper propertyMapper;

    @Override
    public void add(Property p) {
        propertyMapper.insert(p);
    }

    @Override
    public void delete(int id) {
        propertyMapper.deleteValue(id);
        propertyMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Property p) {
        propertyMapper.updateByPrimaryKeySelective(p);
    }

    @Override
    public Property get(int id) {
        return propertyMapper.selectByPrimaryKey(id);
    }

    @Override
    public List list(int cid) {
        PropertyExample example =new PropertyExample();
        example.createCriteria().andCidEqualTo(cid);
        example.setOrderByClause("id desc");
        return propertyMapper.selectByExample(example);
    }
}
