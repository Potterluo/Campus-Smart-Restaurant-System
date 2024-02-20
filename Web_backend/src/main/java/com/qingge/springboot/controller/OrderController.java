package com.qingge.springboot.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.entity.Order;
import com.qingge.springboot.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    //查询所有数据
    @GetMapping
    public List<Order> findall(){
        return orderService.list();
    }

    //新增和修改
    @PostMapping
    public boolean save(@RequestBody Order order){
        return orderService.saveOrder(order);
    }

    @GetMapping("/page")
    public IPage<Order> findPage(@RequestParam Integer pageNum,
                                 @RequestParam Integer pageSize,
                                 @RequestParam(defaultValue = "") String address) {
        IPage<Order> page = new Page<>(pageNum, pageSize);
        QueryWrapper<Order> queryWrapper = new QueryWrapper<>();
        if (!"".equals(address)) {
            queryWrapper.like("address", address);
        }
        Date date=new Date();
        System.out.println(date);
        /*queryWrapper.orderByDesc("id");*/
        return orderService.page(page, queryWrapper);
    }

}
