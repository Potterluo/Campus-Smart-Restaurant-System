/*
 * 硬件连接MQTT服务器，
*/
#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#include <ArduinoJson.h>
#include <Arduino_JSON.h>

#define mqtt_server "43.138.44.38"  // EMQX服务器的域名
#define publish_topic "/client1/pub"   //发布消息主题
#define subscribe_topic "hello"  //订阅消息的主题

#define LED1  D7
#define LED2  D6
#define LED3  D0
#define LED4  D1

#define  IA  D5  //  pin D5 connected to pin IA
#define IB  D2  //  pin D2 connected to pin IB
//L9110接线，电源外置
byte speed = 255 ;  // L9110转速设为255

const char* ssid     = "ZZURJQM";
const char* password = "121121121";
WiFiClient wifiClient;//连接对象
PubSubClient mqttClient(wifiClient);

unsigned long lastMsg = 0;
#define MSG_BUFFER_SIZE  (50)
char msg[MSG_BUFFER_SIZE];
int value = 0;

void setup(){
  Serial.begin(115200);
  setup_wifi();
  mqtt_start();
  pinMode(LED1, OUTPUT);
  digitalWrite(LED1, HIGH);
  pinMode(LED2, OUTPUT);
  digitalWrite(LED2, HIGH);
  pinMode(LED3, OUTPUT);
  digitalWrite(LED3, HIGH);
  pinMode(LED4, OUTPUT);
  digitalWrite(LED4, HIGH);
  pinMode(IA, OUTPUT); // 定义IA脚输出
  pinMode(IB, OUTPUT); // 定义IB脚输出
}

void loop(){  
  if (!mqttClient.connected()) {
    reconnect();
  }
  mqttClient.loop();

  unsigned long now = millis();
  if (now - lastMsg > 2000) {
    lastMsg = now;
    ++value;
    //snprintf (msg, MSG_BUFFER_SIZE, "hello world #%ld", value);
    //Serial.println(topic);
    //Serial.print(": ");
    //Serial.println(msg);
    //mqttClient.publish(publish_topic, msg);
  }
}

void setup_wifi(){
  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);

  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);      

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}

void mqtt_start(){
  mqttClient.setServer(mqtt_server, 1883);
  mqttClient.setCallback(callback); //监听服务器下发的消息
  while (!mqttClient.connected()) {
    Serial.println("Connecting to public emqx mqtt broker.....");
    if (mqttClient.connect("esp8266-client")) {
        Serial.println("Public emqx mqtt broker connected");
    } else {
        Serial.print("failed with state ");
        Serial.print(mqttClient.state());
        delay(2000);
    }
  }
  mqttClient.subscribe(subscribe_topic);
  mqttClient.publish(publish_topic, "hello mqtt");
}

void callback(char *topic, byte *payload, unsigned int length) {
    Serial.print("Message arrived in topic: ");
    Serial.println(topic);
    Serial.print("Message:");
    String message;
    for (int i = 0; i < length; i++) {
        message = message + (char) payload[i];  // convert *byte to string
    }
    Serial.print(message);
    /*if(message=="true")
    {
      digitalWrite(LED1, LOW);
    }
    if(message=="false")
    {
      digitalWrite(LED1, HIGH);
    }*/
    JSONVar myArray = JSON.parse(message);
    if(myArray[0])
    {
      Serial.println("LED1");
      Serial.println(myArray[0]);
      digitalWrite(LED1, LOW);
    }else{
      digitalWrite(LED1, HIGH);
    }
    if(myArray[1])
    {
      Serial.println("LED2");
      digitalWrite(LED2, LOW);
    }else{
      digitalWrite(LED2, HIGH);
    }
    if(myArray[2])
    {
      Serial.println("LED3");
      digitalWrite(LED3, LOW);
    }else{
      digitalWrite(LED3, HIGH);
    }
    if(myArray[3])
    {
      Serial.println("LED4");
      digitalWrite(LED4, LOW);
    }else{
      digitalWrite(LED4, HIGH);
    }
    if(myArray[4])
    {
      Serial.print("open:");
      Serial.println(myArray[4]);
      analogWrite(IA, 0);
      analogWrite(IB, speed);
      delay(800);
      analogWrite(IA, 0);
      analogWrite(IB, 0);
    }
    if(myArray[5])
    {
      Serial.print("close:");
      Serial.println(myArray[4]);
      analogWrite(IA, speed);
      analogWrite(IB, 0);
      delay(800);
      analogWrite(IA, 0);
      analogWrite(IB, 0);
    }
   
    Serial.println(); 
}

void reconnect(){
  // Loop until we're reconnected
  while (!mqttClient.connected()) {
    Serial.print("Attempting MQTT connection...");
    // Create a random client ID
    String clientId = "ESP8266Client-";
    clientId += String(random(0xffff), HEX);
    // Attempt to connect
    if (mqttClient.connect(clientId.c_str())) {
      Serial.println("connected");
      // Once connected, publish an announcement...
      mqttClient.publish(publish_topic, "hello world");
      // ... and resubscribe
      mqttClient.subscribe(subscribe_topic);
    } else {
      Serial.print("failed, rc=");
      Serial.print(mqttClient.state());
      Serial.println(" try again in 5 seconds");
      // Wait 5 seconds before retrying
      delay(5000);
    }
  }
}
