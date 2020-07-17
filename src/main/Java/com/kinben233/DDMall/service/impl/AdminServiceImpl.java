package com.kinben233.DDMall.service.impl;

import com.kinben233.DDMall.pojo.Admin;
import com.kinben233.DDMall.mapper.AdminMapper;
import com.kinben233.DDMall.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminMapper adminMapper;

    @Override
    public Admin get(String name,String password){
        Admin admin=new Admin();
        Map<String,Object> params=new HashMap<>();
        params.put("name",name);
        params.put("password",password);
        admin=adminMapper.get(params);
        return admin;
    }
}
