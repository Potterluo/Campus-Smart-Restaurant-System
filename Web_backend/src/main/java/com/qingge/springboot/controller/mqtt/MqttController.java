package com.qingge.springboot.controller.mqtt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/test")
public class MqttController {

    @Resource
    private MqttGateway mqttGateway;

    @RequestMapping("/sendMqtt")
    public String sendMqtt(String  sendData,String topic){
//        mqttGateway.sendToMqtt(sendData,"hello");
        sendData="["+sendData+"]";
        mqttGateway.sendToMqtt(sendData,topic);
        return "发送内容："+sendData+"成功----"+"主题："+topic;
    }
}
//https://blog.csdn.net/qq_30737525/article/details/102820278
