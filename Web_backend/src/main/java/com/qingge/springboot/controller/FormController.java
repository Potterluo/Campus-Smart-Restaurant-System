package com.qingge.springboot.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qingge.springboot.entity.Form;
import com.qingge.springboot.service.FormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/form")
public class FormController {
    @Autowired
    private FormService formService;

    //查询所有数据
    @GetMapping
    public List<Form> findall(){

        return formService.list();
    }

    //新增和修改
    @PostMapping
    public boolean save(@RequestBody Form form){
        return formService.saveForm(form);
    }

    @GetMapping("/page")
    public IPage<Form> findPage(@RequestParam Integer pageNum,
                                @RequestParam Integer pageSize,
                                @RequestParam(defaultValue = "") String customer) {
        IPage<Form> page = new Page<>(pageNum, pageSize);
        QueryWrapper<Form> queryWrapper = new QueryWrapper<>();
        if (!"".equals(customer)) {
            queryWrapper.like("customer", customer);
        }
        /*queryWrapper.orderByDesc("id");*/
        return formService.page(page, queryWrapper);
    }
}
