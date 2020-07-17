package com.kinben233.DDMall.service.impl;

import com.kinben233.DDMall.mapper.ProductMapper;
import com.kinben233.DDMall.pojo.Product;
import com.kinben233.DDMall.pojo.ProductImage;
import com.kinben233.DDMall.pojo.Category;
import com.kinben233.DDMall.pojo.ProductExample;
import com.kinben233.DDMall.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ProductServiceImpl implements ProductService{
    @Autowired
    ProductMapper productMapper;
    @Autowired
    CategoryService categoryService;
    @Autowired
    OrderItemService orderItemService;
    @Autowired
    ProductImageService productImageService;
    @Autowired
    ReviewService reviewService;

    @Override
    public void add(Product p){
        productMapper.insert(p);
    }

    @Override
    public void delete(int id){
        productMapper.deleteValue(id);
        Product p=productMapper.selectByPrimaryKey(id);
        p.setStatus("delete");
        productMapper.updateByPrimaryKeySelective(p);
    }

    @Override
    public void update(Product p){
        productMapper.updateByPrimaryKeySelective(p);
    }

    @Override
    public Product get(int id){
        Product p=productMapper.selectByPrimaryKey(id);
        setFirstProductImage(p);
        setCategory(p);
        return p;
    }

    public void setCategory(List<Product> ps){
        for (Product p : ps)
            setCategory(p);
    }
    public void setCategory(Product p){
        int cid = p.getCid();
        Category c = categoryService.get(cid);
        p.setCategory(c);
    }

    @Override
    public List list(int cid){
        ProductExample example = new ProductExample();
        example.createCriteria().andCidEqualTo(cid).andStatusIsNotNull().andStatusNotEqualTo("delete");
        example.setOrderByClause("id desc");
        List<Product> result = productMapper.selectByExample(example);
        setCategory(result);
        setFirstProductImage(result);
        return result;
    }

    @Override
    public void setFirstProductImage(Product p) {
        List<ProductImage> pis = productImageService.list(p.getId(), ProductImageService.type_single);
        if (!pis.isEmpty()) {
            ProductImage pi = pis.get(0);
            p.setFirstProductImage(pi);
        }
    }

    public void setFirstProductImage(List<Product> ps) {
        for (Product p : ps) {
            setFirstProductImage(p);
        }
    }

    @Override
    public void fill(List<Category> cs) {  //为多个分类填充产品集合
        for (Category c : cs) {
            fill(c);
        }
    }

    @Override
    public void fill(Category c) {         //为分类填充产品集合
        List<Product> ps = list(c.getId());
        c.setProducts(ps);
    }

    @Override
    public void fillByRow(List<Category> cs) {  //为多个分类填充推荐产品集合，即把分类下的产品集合，按照8个为一行，拆成多行，以利于后续页面上进行显示
        int productNumberEachRow = 8;
        for (Category c : cs) {
            List<Product> products =  c.getProducts();
            List<List<Product>> productsByRow =  new ArrayList<>();
            for (int i = 0; i < products.size(); i+=productNumberEachRow) {
                int size = i+productNumberEachRow;
                size= size>products.size()?products.size():size;
                List<Product> productsOfEachRow =products.subList(i, size);
                productsByRow.add(productsOfEachRow);
            }
            c.setProductsByRow(productsByRow);
        }
    }

    @Override
    public void setSaleAndReviewNumber(Product p) {
        int saleCount = orderItemService.getSaleCount(p.getId());
        p.setSaleCount(saleCount);

        int reviewCount = reviewService.getCount(p.getId());
        p.setReviewCount(reviewCount);
    }

    @Override
    public void setSaleAndReviewNumber(List<Product> ps) {
        for (Product p : ps) {
            setSaleAndReviewNumber(p);
        }
    }

    @Override
    public List<Product> search(String keyword) {
        ProductExample example = new ProductExample();
        example.createCriteria().andNameLike("%" + keyword + "%");
        example.setOrderByClause("id desc");
        List result = productMapper.selectByExample(example);
        setFirstProductImage(result);
        setCategory(result);
        return result;
    }
}
