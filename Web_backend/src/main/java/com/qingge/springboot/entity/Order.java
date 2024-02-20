package com.qingge.springboot.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@TableName(value = "sys_order")
public class Order {
    @TableId
    private String id;
    /*@DateTimeFormat(fallbackPatterns = "yyyy-MM-dd HH:mm:ss")*/
    private String time;
    private String address;
    private String money;
    private String student;
    private String remakes;
    private String diets;


}
