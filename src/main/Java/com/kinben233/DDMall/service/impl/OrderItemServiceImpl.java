package com.kinben233.DDMall.service.impl;

import java.util.List;

import com.kinben233.DDMall.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kinben233.DDMall.mapper.OrderItemMapper;
import com.kinben233.DDMall.pojo.Order;
import com.kinben233.DDMall.pojo.OrderItem;
import com.kinben233.DDMall.pojo.OrderItemExample;
import com.kinben233.DDMall.pojo.Product;
import com.kinben233.DDMall.service.OrderItemService;
import com.kinben233.DDMall.service.ProductService;

@Service
public class OrderItemServiceImpl implements OrderItemService{
    @Autowired
    OrderItemMapper orderItemMapper;
    @Autowired
    ProductService productService;
    @Autowired
    OrderService orderService;

    @Override
    public void add(OrderItem c) {
        orderItemMapper.insert(c);
    }

    @Override
    public void delete(int id) {
        orderItemMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(OrderItem c) {
        orderItemMapper.updateByPrimaryKeySelective(c);
    }

    @Override
    public OrderItem get(int id) {
        OrderItem result = orderItemMapper.selectByPrimaryKey(id);
        setProduct(result);
        return result;
    }

    public List<OrderItem> list(){
        OrderItemExample example =new OrderItemExample();
        example.setOrderByClause("id desc");
        return orderItemMapper.selectByExample(example);

    }

    @Override
    public void fill(List<Order> os) {
        for (Order o : os) {
            fill(o);
        }
    }

    //根据订单id查询出其对应的所有订单项
    //通过setProduct为所有的订单项设置Product属性
    //遍历所有的订单项，然后计算出该订单的总金额和总数量
    //最后再把订单项设置在订单的orderItems属性上
    public void fill(Order o) {
        OrderItemExample example =new OrderItemExample();
        example.createCriteria().andOidEqualTo(o.getId());   //找出订单的所有订单项
        example.setOrderByClause("id desc");                 //倒序排列
        List<OrderItem> ois =orderItemMapper.selectByExample(example); //ois是所有订单项的集合
        setProduct(ois);
        float total = 0;
        int totalNumber = 0;
        for (OrderItem oi : ois) {
            total+=oi.getNumber()*oi.getProduct().getPromotePrice();
            totalNumber+=oi.getNumber();
        }
        o.setTotal(total);
        o.setTotalNumber(totalNumber);
        o.setOrderItems(ois);
    }

    public void setProduct(List<OrderItem> ois){
        for (OrderItem oi: ois) {
            setProduct(oi);
        }
    }

    private void setProduct(OrderItem oi) {
        Product p = productService.get(oi.getPid());  //Pid参考表product
        oi.setProduct(p);    //订单项的产品
    }

    @Override
    public int getSaleCount(int pid) {
        OrderItemExample example =new OrderItemExample();
        example.createCriteria().andPidEqualTo(pid).andOidIsNotNull();
        List<OrderItem> ois =orderItemMapper.selectByExample(example);
        int result =0;
        for (OrderItem oi : ois) {
            Order o=orderService.get(oi.getOid());
            if(!o.getStatus().equals("未知")&&!o.getStatus().equals("待付款")) {
                result += oi.getNumber();
            }
        }
        return result;
    }

    @Override
    public List<OrderItem> listByUser(int uid) {
        OrderItemExample example =new OrderItemExample();
        example.createCriteria().andUidEqualTo(uid).andOidIsNull();
        List<OrderItem> result =orderItemMapper.selectByExample(example);
        setProduct(result);
        return result;
    }
}
