package com.qingge.springboot.controller;

import com.qingge.springboot.entity.Device;
import com.qingge.springboot.service.DeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/device")
public class DeviceController {
    @Autowired
    private DeviceService deviceService;

    //查询所有数据
    @GetMapping
    public List<Device> findall(){
        //List<User> all=userMapper.findAll();
        return deviceService.list();
    }

    //新增和修改
    @PostMapping
    public boolean save(@RequestBody Device device){
        System.out.println("收到数据");
        return deviceService.saveDevice(device);
    }
}
