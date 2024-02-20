package com.qingge.springboot.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
;
import com.qingge.springboot.entity.Stenv;
import com.qingge.springboot.service.StenvService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/stenv")
public class StenvController {

    @Autowired
    private StenvService stenvService;

    @GetMapping
    public IPage<Stenv> findNew() {
        IPage<Stenv> page = new Page<>(1, 1);
        QueryWrapper<Stenv> queryWrapper = new QueryWrapper<>();

        /*queryWrapper.orderByDesc("id");*/
        queryWrapper.orderByDesc("id");
        return stenvService.page(page, queryWrapper);
    }

    @PostMapping
    public boolean save(@RequestBody Stenv stenv){
        System.out.println("收到数据");
        return stenvService.saveStenv(stenv);
    }







}
