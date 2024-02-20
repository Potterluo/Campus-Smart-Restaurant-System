package com.qingge.springboot.config;

import com.qingge.springboot.controller.mqtt.MqttGateway;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.integration.annotation.IntegrationComponentScan;
import org.springframework.integration.annotation.ServiceActivator;
import org.springframework.integration.channel.DirectChannel;
import org.springframework.integration.core.MessageProducer;
import org.springframework.integration.mqtt.core.DefaultMqttPahoClientFactory;
import org.springframework.integration.mqtt.core.MqttPahoClientFactory;
import org.springframework.integration.mqtt.inbound.MqttPahoMessageDrivenChannelAdapter;
import org.springframework.integration.mqtt.outbound.MqttPahoMessageHandler;
import org.springframework.integration.mqtt.support.DefaultPahoMessageConverter;
import org.springframework.messaging.*;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;


@Configuration
@IntegrationComponentScan
public class MqttSenderConfig {

    @Value("${spring.mqtt.username}")
    private String username;

    @Value("${spring.mqtt.password}")
    private String password;

    @Value("${spring.mqtt.url}")
    private String hostUrl;

    @Value("${spring.mqtt.client.id}")
    private String clientId;

    @Value("${spring.mqtt.default.topic}")
    private String defaultTopic;

    @Bean
    public MqttConnectOptions getMqttConnectOptions(){
        MqttConnectOptions mqttConnectOptions=new MqttConnectOptions();
        mqttConnectOptions.setUserName(username);
        mqttConnectOptions.setPassword(password.toCharArray());
        mqttConnectOptions.setServerURIs(new String[]{hostUrl});
        return mqttConnectOptions;
    }
    @Bean
    public MqttPahoClientFactory mqttClientFactory() {
        DefaultMqttPahoClientFactory factory = new DefaultMqttPahoClientFactory();
        factory.setConnectionOptions(getMqttConnectOptions());
        return factory;
    }
    @Bean
    @ServiceActivator(inputChannel = "mqttOutboundChannel")
    public MessageHandler mqttOutbound() {
        MqttPahoMessageHandler messageHandler =  new MqttPahoMessageHandler(clientId, mqttClientFactory());
        messageHandler.setAsync(true);
        messageHandler.setDefaultTopic(defaultTopic);
        return messageHandler;
    }

    @Bean
    public MessageChannel mqttOutboundChannel() {
        return new DirectChannel();
    }

    @Value("${spring.mqtt.consumer.defaultTopic}")
    private String consumerDefaultTopic;

    @Value("${spring.mqtt.consumer.clientId}")
    private String consumerClientId;



    /**
     * MQTT消息订阅绑定（消费者）
     *
     * @return {@link org.springframework.integration.core.MessageProducer}
     */


    @Bean
    public MessageProducer inbound() {
        // 可以同时消费（订阅）多个Topic
        MqttPahoMessageDrivenChannelAdapter adapter =
                new MqttPahoMessageDrivenChannelAdapter(
                        consumerClientId, mqttClientFactory(),
                        StringUtils.split(consumerDefaultTopic, ","));
        adapter.setCompletionTimeout(5000);
        adapter.setConverter(new DefaultPahoMessageConverter());
        adapter.setQos(1);
        // 设置订阅通道
        adapter.setOutputChannel(mqttInboundChannel());
        return adapter;
    }


    /**
     * MQTT信息通道（消费者）
     *
     * @return {@link org.springframework.messaging.MessageChannel}
     */

    @Bean(name = "mqttInboundChannel")
    public MessageChannel mqttInboundChannel() {
        return new DirectChannel();
    }


    /**
     * MQTT消息处理器（消费者）
     *
     * @return {@link org.springframework.messaging.MessageHandler}
     */

    @Resource
    private MqttGateway mqttGateway;

    @Bean
    @ServiceActivator(inputChannel = "mqttInboundChannel")
    public MessageHandler handler() {
        return new MessageHandler() {
            @Override
            public void handleMessage(Message<?> message) throws MessagingException {
                System.out.println("MqttSenderConfigClass.handleMessage"+message.getPayload()+message.toString());
                String status1 = (String) message.getPayload();
                MessageHeaders sendHeaders =message.getHeaders();
                System.out.println(sendHeaders.get("mqtt_receivedTopic"));//
                String sender = (String) sendHeaders.get("mqtt_receivedTopic");
                mqttGateway.sendToMqtt(status1,"hello1");
                /*if(true)
                {
                    System.out.println("进来了");
                    Temp temp1 = null;
                    Float temperature=Float.parseFloat(status1);
                    temp1.setTemperature(temperature);
                    if(temperature>36&&temperature<=37.3){
                        temp1.setStatus("正常");
                        temp1.setValue("success");
                    }else if (temperature>37.3&&temperature<40){
                        temp1.setStatus("发热风险");
                        temp1.setValue("danger");
                    }else{
                        temp1.setStatus("无效数据");
                        temp1.setValue("info");
                    }
                    TempService tempService = null;
                    tempService.saveTemp(temp1);
                }
*/

            }
        };
    }
}
