package com.qingge.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName(value = "sys_temp")
public class Temp {
    @TableId(value="id",type = IdType.AUTO)
    private Integer id;
    private Date time;
    private String location;
    private Float temperature;
    private String status;

}
