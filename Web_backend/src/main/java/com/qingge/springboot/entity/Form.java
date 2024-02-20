package com.qingge.springboot.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName(value = "form")
public class Form {
    @TableId
    private String id;
    private String customer;
    private Date date;
    private String address;
    private String goods;
    private String tag;
    private String delivery;
}
