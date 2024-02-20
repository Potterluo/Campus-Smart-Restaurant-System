package com.qingge.springboot.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName(value = "sys_stenv")
public class Stenv {
    @TableId(value="id",type = IdType.AUTO)
    private Integer id;
    private Date createdTime;
    private float temperature;
    private float humidity;
    private boolean fire;
}
