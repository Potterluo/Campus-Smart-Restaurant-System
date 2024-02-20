package com.qingge.springboot.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qingge.springboot.entity.Order;
import com.qingge.springboot.mapper.OrderMapper;
import org.springframework.stereotype.Service;

@Service
public class OrderService extends ServiceImpl<OrderMapper, Order> {
    public boolean saveOrder(Order order) {
        return  saveOrUpdate(order);
    }
}
