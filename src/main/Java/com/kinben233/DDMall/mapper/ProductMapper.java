package com.kinben233.DDMall.mapper;

import com.kinben233.DDMall.pojo.Product;
import com.kinben233.DDMall.pojo.ProductExample;
import java.util.List;

public interface ProductMapper {
    int deleteByPrimaryKey(Integer id);   //删除project表中的项目，有外键约束，删除前必须执行deleteValue

    int deleteValue(Integer id);      //删除propertyvalue表中所有pid=id的属性值

    int insert(Product record);       //插入产品

    int insertSelective(Product record);  //插入产品，跳过为NULL的项

    List<Product> selectByExample(ProductExample example);  //返回所有符合example的元组

    Product selectByPrimaryKey(Integer id);  //按照id查找

    int updateByPrimaryKeySelective(Product record);  //更新产品，跳过为NULL的项

    int updateByPrimaryKey(Product record);  //更新产品
}