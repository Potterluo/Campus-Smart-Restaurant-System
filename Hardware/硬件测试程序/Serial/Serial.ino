#include <ESP8266WiFi.h>
//http://www.javashuo.com/article/p-kmlvkeeb-hn.html，ESP8266WiFi库的使用
void setup() {
// put your setup code here, to run once:
const char* ssid = "ZZURJQM";
const char* password = "121121121";
// Start Serial
Serial.begin(115200);
// Connect to WiFi
WiFi.begin(ssid, password);
while (WiFi.status() != WL_CONNECTED) {
delay(500);
Serial.print(".");
}
Serial.println("");
Serial.println("WiFi connected");
// Print the IP address
IPAddress localIP();
if (WiFi.status() == WL_CONNECTED)
{
  Serial.print("Connected, IP address: ");
  Serial.println(WiFi.localIP());
  //Connected, IP address: 192.168.1.10
}
}
void loop() {
// put your main code here, to run repeatedly:

}
