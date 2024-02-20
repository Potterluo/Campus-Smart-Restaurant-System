package com.qingge.springboot.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qingge.springboot.entity.Form;
import com.qingge.springboot.mapper.FormMapper;
import org.springframework.stereotype.Service;

@Service
public class FormService extends ServiceImpl<FormMapper, Form> {
    public boolean saveForm(Form form) {

        return  saveOrUpdate(form);
    }


}
