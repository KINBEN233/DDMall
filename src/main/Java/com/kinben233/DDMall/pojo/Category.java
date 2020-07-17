package com.kinben233.DDMall.pojo;

import java.util.List;

public class Category {
    private Integer id;

    private String name;

    private String status;

    /*以下是非数据库字段，用于前端显示*/
    private List<Product> products;

    private List<List<Product>> productsByRow;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public List<List<Product>> getProductsByRow() {
        return productsByRow;
    }

    public void setProductsByRow(List<List<Product>> productsByRow) {
        this.productsByRow = productsByRow;
    }

    public String getStatus() {return status;}

    public void setStatus(String status) {this.status=status;}
}