#include <PubSubClient.h>
#include <stdlib.h>
#include <ArduinoJson.h>
 
#include <ESP8266WiFi.h> 
#include <Ticker.h>
  
#define SENSOR_PIN 12 
 
#define WIFI_SSID "ZZURJQM"
#define WIFI_PASSWD "121121121" //
 
#define MQTT_SERVER "183.230.40.39"
#define MQTT_PORT 6002 
#define MQTT_USRNAME  "7L2msfsOKB"
#define MQTT_PASSWD "nhd1Wop5eaRrt/7uQsce5eV2WIl3ZvMDn692pcnQrOU="
#define CLIENT_ID "UmURiIG9S/i2UcN/KxpQeQ92W3YzBjrlt4n08tOIdu4=" 
 
 
#define ALINK_TOPIC_PROP_POST "$dp"
 
 
 
unsigned char LED_STATE =  0; //0开 1关
 
 
uint32_t x=0;
Ticker flipper;
 
WiFiClient espClient; 
 
PubSubClient client(espClient);
 
 
void callback(char *topic, byte *payload, unsigned int length) 
{
  
  Serial.print(topic);
  Serial.print("Message arrived [");
  payload[length] = '\0';
  Serial.print((char *)payload);
  Serial.println("]");
 
 
    StaticJsonBuffer<100> jsonBuffer; 
    JsonObject& root = jsonBuffer.parseObject(payload);
 
  String type = root["type"];
  
  if(strcmp(type.c_str(), "led") == 0)
  {
    LED_STATE = root["value"];
    digitalWrite(BUILTIN_LED, !LED_STATE);   // Turn the LED on (Note that LOW is the voltage level
    flip();
  }
 
    
 
//  if (strstr(topic, ALINK_TOPIC_PROP_SET))
//  {
//    if (!root.success()) 
//    {
//      Serial.println("parseObject() failed");
//      return ;
//    }
//  }
 
 
  Serial.println();
  Serial.println();
  
}
 
 
void mqttCheckConnect() 
{
  while (!client.connected())
  {
    Serial.println("Connecting to MQTT Server ...");
 
       if (client.connect(CLIENT_ID,MQTT_USRNAME,MQTT_PASSWD))
      {
        Serial.println("MQTT Connected!");  
       // client.subscribe(ALINK_TOPIC_PROP_POSTRSP);
//        client.subscribe(ALINK_TOPIC_PROP_SET);
        Serial.println("subscribe done"); 
       }
      else 
      {
        Serial.print("MQTT Connect err:");
        Serial.println(client.state());
        delay(5000);
      }
  }
}/**/
 
 
void flip() {
  if(!client.connected())
  {
    return;
  }
 
//{
//  "datastreams": [{
//    "id": "shujiliu",
//    "datapoints": [{
//      "value": "0"
//    }]
//  }]
//}
 
//  StaticJsonBuffer<200> jsonBuffer;
  
//  JsonObject& root = jsonBuffer.createObject();
////  root["id"] = x;
////  root["version"] = "1.0";
////  root["method"] = "thing.event.property.post";
//  
//  JsonArray& data = root.createNestedArray("datastreams");
//  JsonObject& data_array = jsonBuffer.createObject();
//  data_array["id"] = "LedData";
//  data.add(data_array);
//
//  JsonArray& datapoints = data_array.createNestedArray("datapoints");
//  JsonObject& datapoints_array = jsonBuffer.createObject();
//
//  JsonObject& data_value = jsonBuffer.createObject();
//  data_value["type"] = "led";
//  data_value["value"] = LED_STATE;
//  
//  String data_valueStr;
//  data_value.printTo(data_valueStr);
//  
//  datapoints_array["value"] = data_valueStr.c_str();
//  datapoints.add(datapoints_array);
//  String outputStr;
//  root.printTo(outputStr);
//  outputStr += '\0';
 
    char  json[256];
    char* jsonStr = "{\"datastreams\":[{\"id\":\"LedData\",\"datapoints\":[{\"value\":\"{\\\"type\\\":\\\"led\\\",\\\"value\\\":%d}\"}]}]}";
    sprintf(json, jsonStr, LED_STATE);
   
    unsigned short outputStrLen = strlen(json);
   
    unsigned char t_payload[outputStrLen + 3];
  
    t_payload[0] =  '\x01';
    t_payload[1] =  outputStrLen >> 8;
    t_payload[2] = outputStrLen;
    memcpy(t_payload + 3, json, outputStrLen);
 
    Serial.println(json);
    client.publish(ALINK_TOPIC_PROP_POST,t_payload,outputStrLen + 3);
  
}
 
void setup() {
  WiFi.mode(WIFI_STA);
  WiFi.begin(WIFI_SSID, WIFI_PASSWD);
  Serial.begin(115200);
  ESP.wdtEnable(WDTO_8S);
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, !LED_STATE);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println(".");
  }
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());/*WiFi初始化*/
  client.setServer(MQTT_SERVER,MQTT_PORT); /*连接MQTT服务器*/
  client.setCallback(callback);
 
  flipper.attach(5, flip);
} 
 
 
void loop() {
  ESP.wdtFeed();
  mqttCheckConnect();
  client.loop();
}
