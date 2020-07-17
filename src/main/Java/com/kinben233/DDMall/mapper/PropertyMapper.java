package com.kinben233.DDMall.mapper;

import com.kinben233.DDMall.pojo.Property;
import com.kinben233.DDMall.pojo.PropertyExample;
import java.util.List;

public interface PropertyMapper {
    int deleteByPrimaryKey(Integer id);

    int deleteValue(Integer id);

    int insert(Property record);

    int insertSelective(Property record);

    List<Property> selectByExample(PropertyExample example);

    Property selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Property record);

    int updateByPrimaryKey(Property record);
}