package com.qingge.springboot.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qingge.springboot.entity.Temp;
import com.qingge.springboot.mapper.TempMapper;
import org.springframework.stereotype.Service;

@Service
public class TempService extends ServiceImpl<TempMapper, Temp>{
    public boolean saveTemp(Temp temp) {
        return  saveOrUpdate(temp);
    }

}
