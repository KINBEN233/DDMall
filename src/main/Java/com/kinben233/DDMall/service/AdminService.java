package com.kinben233.DDMall.service;

import com.kinben233.DDMall.pojo.Admin;

import java.util.Map;

public interface AdminService {
    Admin get(String name,String password);
}
