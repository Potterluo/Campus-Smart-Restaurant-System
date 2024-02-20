package com.qingge.springboot.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName(value = "sys_device")
public class Device {
    @TableId
    private String id;
    private String name;
    private String sat;

}
