package com.kinben233.DDMall.service.impl;

import java.util.List;

import com.kinben233.DDMall.pojo.OrderItem;
import com.kinben233.DDMall.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kinben233.DDMall.mapper.OrderMapper;
import com.kinben233.DDMall.pojo.Order;
import com.kinben233.DDMall.pojo.OrderExample;
import com.kinben233.DDMall.pojo.User;
import com.kinben233.DDMall.service.OrderService;
import com.kinben233.DDMall.service.UserService;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OrderServiceImpl implements OrderService{
    @Autowired
    OrderMapper orderMapper;

    @Autowired
    UserService userService;

    @Autowired
    OrderItemService orderItemService;

    @Override
    public void add(Order c) {
        orderMapper.insert(c);
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")

    public float add(Order o, List<OrderItem> ois) {
        float total = 0;
        add(o);

        for (OrderItem oi: ois) {
            oi.setOid(o.getId());
            orderItemService.update(oi);
            total+=oi.getProduct().getPromotePrice()*oi.getNumber();
        }
        return total;
    }

    @Override
    public void delete(int id) {
        orderMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Order c) {
        orderMapper.updateByPrimaryKeySelective(c);
    }

    @Override
    public Order get(int id) {
        return orderMapper.selectByPrimaryKey(id);
    }

    public List<Order> list(){
        OrderExample example =new OrderExample();
        example.setOrderByClause("id desc");
        List<Order> result =orderMapper.selectByExample(example);
        setUser(result);
        return result;
    }
    public void setUser(List<Order> os){
        for (Order o : os)
            setUser(o);
    }
    public void setUser(Order o){
        int uid = o.getUid();
        User u = userService.get(uid);
        o.setUser(u);
    }

    @Override
    public  List list(int uid){
        OrderExample example=new OrderExample();
        example.createCriteria().andUidEqualTo(uid);
        example.setOrderByClause("id desc");
        return  orderMapper.selectByExample(example);
    }

    @Override
    public List list(int uid, String excludedStatus) {
        OrderExample example =new OrderExample();
        example.createCriteria().andUidEqualTo(uid).andStatusNotEqualTo(excludedStatus);
        example.setOrderByClause("id desc");
        return orderMapper.selectByExample(example);
    }
}
