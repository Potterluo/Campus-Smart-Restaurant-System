package com.qingge.springboot.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.qingge.springboot.entity.Stenv;
import com.qingge.springboot.mapper.StenvMapper;
import org.springframework.stereotype.Service;

import javax.xml.transform.Result;

@Service
public class StenvService extends ServiceImpl<StenvMapper, Stenv> {
    public boolean saveStenv(Stenv stenv) {

        return  saveOrUpdate(stenv);
    }



}
