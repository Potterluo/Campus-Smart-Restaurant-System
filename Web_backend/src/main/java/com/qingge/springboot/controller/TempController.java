package com.qingge.springboot.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.entity.Form;
import com.qingge.springboot.entity.Temp;
import com.qingge.springboot.service.TempService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/temp")
public class TempController {
    @Autowired
    private TempService tempService;

    //查询所有数据
    @GetMapping
    public List<Temp> findall(){

        return tempService.list();
    }

    //新增和修改
    @PostMapping
    public boolean save(@RequestBody Temp temp){
        return tempService.saveTemp(temp);
    }

    @GetMapping("/page")
    public IPage<Temp> findPage(@RequestParam Integer pageNum,
                                @RequestParam Integer pageSize) {
        IPage<Temp> page = new Page<>(pageNum, pageSize);
        QueryWrapper<Temp> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        return tempService.page(page, queryWrapper);
    }

}
