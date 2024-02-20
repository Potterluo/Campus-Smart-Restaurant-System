/**
    Get the Weather from intenet with esp8266
 
    get data from 心知天气：[url=http://www.thinkpage.cn/]http://www.thinkpage.cn/[/url]
    api 文档说明：[url=http://www.thinkpage.cn/doc]http://www.thinkpage.cn/doc[/url]
    city id list download ：[url=http://www.thinkpage.cn/data/thinkpage_cities.zip]http://www.thinkpage.cn/data/thinkpage_cities.zip[/url]
 
    Created by yfrobot, 2016.8.23
    This example is in public domain.
*/
 
#include <ESP8266WiFi.h>
#include <ArduinoJson.h>
 
WiFiClient client;
 
const char* ssid     = "ZZURJQM";         // XXXXXX -- 使用时请修改为当前你的 wifi ssid
const char* password = "121121121  ";         // XXXXXX -- 使用时请修改为当前你的 wifi 密码
 
 
const char* host = "api.thinkpage.cn";
const char* APIKEY = "24qbvr1mjsnukavo";        //API KEY
const char* city = "huaian";
const char* language = "zh-Hans";
//心知天气获取连接：[url=https://api.thinkpage.cn/v3/weather/daily.json?key=KEY&location=]https://api.thinkpage.cn/v3/weather/daily.json?key=KEY&location=[/url]城市&language=zh-Hans&unit=c&start=-1&days=5
 
const unsigned long BAUD_RATE = 115200;                   // serial connection speed
const unsigned long HTTP_TIMEOUT = 2100;               // max respone time from server
const size_t MAX_CONTENT_SIZE = 2048;                   // max size of the HTTP response
 
// Skip HTTP headers so that we are at the beginning of the response's body
//  -- 跳过 HTTP 头，使我们在响应正文的开头
bool skipResponseHeaders() {
  // HTTP headers end with an empty line
  char endOfHeaders[] = "\r\n\r\n";
 
  client.setTimeout(HTTP_TIMEOUT);
  bool ok = client.find(endOfHeaders);
 
  if (!ok) {
    Serial.println("No response or invalid response!");
  }
 
  return ok;
}
 
// 发送请求指令
bool sendRequest(const char* host, const char* cityid, const char* apiKey) {
  // We now create a URI for the request
  //心知天气
  String GetUrl = "/v3/weather/now.json?key=";
  GetUrl += apiKey;
  GetUrl += "&location=";
  GetUrl += city;
  GetUrl += "&language=";
  GetUrl += language;
 
  // This will send the request to the server
  client.print(String("GET ") + GetUrl + " HTTP/1.1\r\n" +
               "Host: " + host + "\r\n" +
               "Connection: close\r\n\r\n");
  return true;
}
 
// Read the body of the response from the HTTP server -- 从HTTP服务器响应中读取正文
void readReponseContent(char* content, size_t maxSize) {
  size_t length = client.peekBytes(content, maxSize);
  delay(100);
  Serial.println("Get the data from Internet!");
  content[length] = 0;
  Serial.println(content);
  Serial.println("Read Over!");
}
 
// The type of data that we want to extract from the page -- 我们要从此网页中提取的数据的类型
struct UserData {
  char city[16];
  char cnty[16];
  char weather[32];
  char temp[16];
  char feel[16];
  char hum[16];
  char visi[16];
  char udate[32];
};
 
// 解析数据
bool parseUserData(char* content, struct UserData* userData) {
  // Compute optimal size of the JSON buffer according to what we need to parse.
  //  -- 根据我们需要解析的数据来计算JSON缓冲区最佳大小
  // This is only required if you use StaticJsonBuffer. -- 如果你使用StaticJsonBuffer时才需要
  //  const size_t BUFFER_SIZE = 1024;
 
  // Allocate a temporary memory pool on the stack -- 在堆栈上分配一个临时内存池
  //  StaticJsonBuffer<BUFFER_SIZE> jsonBuffer;
  //  -- 如果堆栈的内存池太大，使用 DynamicJsonBuffer jsonBuffer 代替
  // If the memory pool is too big for the stack, use this instead:
  DynamicJsonBuffer jsonBuffer;
 
  JsonObject& root = jsonBuffer.parseObject(content);
 
  if (!root.success()) {
    Serial.println("JSON parsing failed!");
    return false;
  }
  //  const char* x = root["results"][0]["location"]["name"];//
  //  Serial.println(x);
  // Here were copy the strings we're interested in -- 复制我们感兴趣的字符串
  strcpy(userData->city, root["results"][0]["location"]["name"]);
  strcpy(userData->cnty, root["results"][0]["location"]["country"]);
  strcpy(userData->weather, root["results"][0]["now"]["text"]);
  strcpy(userData->temp, root["results"][0]["now"]["temperature"]);
  strcpy(userData->feel, root["results"][0]["now"]["feels_like"]);
  strcpy(userData->hum, root["results"][0]["now"]["humidity"]);
  strcpy(userData->visi, root["results"][0]["now"]["visibility"]);
  strcpy(userData->udate, root["results"][0]["last_update"]);
  // It's not mandatory to make a copy, you could just use the pointers
  // Since, they are pointing inside the "content" buffer, so you need to make
  // sure it's still in memory when you read the string
  //  -- 这不是强制复制，你可以使用指针，因为他们是指向“内容”缓冲区内，所以你需要确保
  //   当你读取字符串时它仍在内存中
 
  return true;
}
 
// Print the data extracted from the JSON -- 打印从JSON中提取的数据
void printUserData(const struct UserData* userData) {
  Serial.println("Print parsed data :");
  Serial.print("City : ");
  Serial.print(userData->city);
  Serial.print(", \t");
  Serial.print("Country : ");
  Serial.println(userData->cnty);
   
  Serial.print("Weather : ");
  Serial.print(userData->weather);
  Serial.print(",\t");
  Serial.print("Temp : ");
  Serial.print(userData->temp);
  Serial.print(" C");
  Serial.print(",\t");
  Serial.print("Feel : ");
  Serial.print(userData->feel);
  Serial.print(" C");
  Serial.print(",\t");
  Serial.print("Humidity : ");
  Serial.print(userData->hum);
  Serial.print(" %");
  Serial.print(",\t");
  Serial.print("visibility : ");
  Serial.print(userData->visi);
  Serial.println(" km");
   
  Serial.print("Last Updata : ");
  Serial.print(userData->udate);
  Serial.println("");
}
 
// Close the connection with the HTTP server -- 关闭与HTTP服务器连接
void stopConnect() {
  Serial.println("Disconnect");
  client.stop();
}
 
void setup(){
  WiFi.mode(WIFI_STA);     //设置esp8266 工作模式
 
  Serial.begin(BAUD_RATE );      //设置波特率
  Serial.println();
  Serial.print("connecting to ");
  Serial.println(ssid);
 
  WiFi.begin(ssid, password);   //连接wifi
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");
  delay(500);
  // Check if a client has connected
  if (!client.connect(host, 80)) {
    Serial.println("connection failed");
    return;
  }
 
  if (sendRequest(host, city, APIKEY) && skipResponseHeaders()) {
    char response[MAX_CONTENT_SIZE];
    readReponseContent(response, sizeof(response));
    UserData userData;
    if (parseUserData(response, &userData)) {
      printUserData(&userData);
    }
  }
  stopConnect();
}
void loop(){
  delay(3000);
}


/*
心知天气参数

location
所查询的位置
参数值范围：
城市拼音/英文名 例如：location=beijing
城市中文名 例如：location=北京 (ESP8266不支持中文)
城市ID 例如：location=WX4FBXXFKE4F
经纬度 例如：location=39.93:116.40 （注意纬度前经度在后，冒号分隔）
IP地址 例如：location=220.181.111.86
“ip”两个字母 自动识别请求IP地址，例如：location=ip

language
语言 (可选)
参数值范围：
en 英文 
zh-Hans 简体中文 
zh-Hant 繁体中文
ja 日语
de 德语
fr 法语
hi 印地语（印度官方语言之一）
id 印度尼西亚语
ru 俄语
th 泰语
默认值：zh-Hans

unit
单位 (可选)
参数值范围：
c 当参数为c时，温度c、风速km/h、能见度km、气压mb
f 当参数为f时，温度f、风速mph、能见度mile、气压inch
默认值：c

天气代码
代码   中文    英文    图标
0     晴    Sunny    晴
1     晴    Clear    晴
2     晴    Fair    晴
3     晴    Fair    晴
4     多云    Cloudy    多云
5     晴间多云    Partly Cloudy    晴间多云
6     晴间多云    Partly Cloudy    晴间多云
7     大部多云    Mostly Cloudy    大部多云
8     大部多云    Mostly Cloudy    大部多云
9     阴    Overcast    阴
10    阵雨    Shower    阵雨
11    雷阵雨    Thundershower    雷阵雨
12    雷阵雨伴有冰雹    Thundershower with Hail    雷阵雨伴有冰雹
13    小雨    Light Rain    小雨
14    中雨    Moderate Rain    中雨
15    大雨    Heavy Rain    大雨
16    暴雨    Storm    暴雨
17    大暴雨    Heavy Storm    大暴雨
18    特大暴雨    Severe Storm    特大暴雨
19    冻雨    Ice Rain    冻雨
20    雨夹雪    Sleet    雨夹雪
21    阵雪    Snow Flurry    阵雪
22    小雪    Light Snow    小雪
23    中雪    Moderate Snow    中雪
24    大雪    Heavy Snow    大雪
25    暴雪    Snowstorm    暴雪
26    浮尘    Dust    浮尘
27    扬沙    Sand    扬沙
28    沙尘暴    Duststorm    沙尘暴
29    强沙尘暴    Sandstorm    强沙尘暴
30    雾    Foggy    雾
31    霾    Haze    霾
32    风    Windy    风
33    大风    Blustery    大风
34    飓风    Hurricane    飓风
35    热带风暴    Tropical Storm    热带风暴
36    龙卷风    Tornado    龙卷风
37    冷    Cold    冷
38    热    Hot    热
99    未知    Unknown

常用心知天气API
英文天气实况：
https://api.thinkpage.cn/v3/weather/now.json?key=xxxxxxxxxxxxxxxx&location=beijing&language=en&unit=c

中文天气实况：
https://api.thinkpage.cn/v3/weather/now.json?key=xxxxxxxxxxxxxxxx&location=beijing&language=zh-Hans&unit=c

天气预报
三日中文天气预报：
https://api.thinkpage.cn/v3/weather/daily.json?key=xxxxxxxxxxxxxxxx&location=beijing&language=zh-Hans&unit=c&start=0&days=3

三天英文天气预报：
https://api.thinkpage.cn/v3/weather/daily.json?key=xxxxxxxxxxxxxxxx&location=beijing&language=en&unit=c&start=0&days=3

https://api.thinkpage.cn/v3/weather/daily.json?key=xxxxxxxxxxxxxxxx&location=beijing&language=en&unit=c&start=1&days=1

中文生活指数：
https://api.thinkpage.cn/v3/life/suggestion.json?key=xxxxxxxxxxxxxxxx&location=beijing&language=zh-Hans

注意：使用时请将以上信息的xxxxxxxxxxxxxxxx更换为自己的心知天气认证密钥码

*/
