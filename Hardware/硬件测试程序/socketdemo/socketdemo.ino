/*
   本实例演示了NodeMCU通过wifi与TCP服务器相连，
   并发送和接受json数据的协议
*/

#include <ESP8266WiFi.h>
#include <Arduino_JSON.h>

#ifndef STASSID
#define STASSID "ZZURJQM_2"                 //wifi连接用户名密码配置
#define STAPSK  "121121121"
#endif

const char* ssid     = STASSID;
const char* password = STAPSK;

const char* host = "192.168.1.101";      //TCP服务器IP地址及其端口号
const uint16_t port = 8000;
WiFiClient client;//连接对象

void setup() {
  Serial.begin(115200);

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

  Serial.print("connecting to ");
  Serial.print(host);
  Serial.print(':');
  Serial.println(port);

  // Use WiFiClient class to create TCP connections
  //WiFiClient client;
  if (!client.connect(host, port)) {
    Serial.println("connection failed");
    delay(5000);
    return;
  }
  Serial.println("sending data to server");
  if (client.connected()) {
    client.println("hello from ESP8266");
  }

  /*给服务器发送json数组*/
  JSONVar myArray;

  myArray[0] = 3.14159;
  myArray[1] = 4242.5;
  myArray[2] = "orange";
  myArray[3] = "world";
  myArray[4] = true;
  myArray[5] = 42;

  client.write("myArray.length() = ");
  client.println(myArray.length());
  
  String jsonString = JSON.stringify(myArray);

  client.write("JSON.stringify(myArray) = ");
  client.println(jsonString);
}

void loop() {
  
  /*unsigned long timeout = millis();
  while (client.available() == 0) {
    if (millis() - timeout > 5000) {
      Serial.println(">>> Client Timeout !");
      client.stop();
      delay(60000);
      return;
    }
  }*/

  String line;
  Serial.println("Web Server Response:");        
    while (client.connected() || client.available()){ 
      if (client.available()){
        line = client.readString();
        Serial.println(line);
        break;
      }
    }
    
    /*解析服务器发过来的json数组*/
    JSONVar myArray1 = JSON.parse(line);
    if (JSON.typeof(myArray1) == "undefined") {
      Serial.println("Parsing input failed!");
    }
    else{
      Serial.print("myArray1.length() = ");
      Serial.println(myArray1.length());
      Serial.println();
     
      Serial.print("JSON.typeof(myArray1[0]) = ");
      Serial.println(JSON.typeof(myArray1[0]));
      Serial.print("myArray1[0] = ");
      Serial.println(myArray1[0]);
      Serial.println();
    }
 
 }

  
  
 
