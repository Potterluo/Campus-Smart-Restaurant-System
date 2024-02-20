package com.qingge.springboot.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qingge.springboot.entity.Device;
import com.qingge.springboot.mapper.DeviceMapper;
import org.springframework.stereotype.Service;

@Service
public class DeviceService extends ServiceImpl<DeviceMapper, Device> {
    public boolean saveDevice(Device device) {

        return  saveOrUpdate(device);
    }
}
