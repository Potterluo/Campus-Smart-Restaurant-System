#define BLINKER_WIFI

#include <Blinker.h>

char auth[] = "20eb713f70cb";
char ssid[] = "ZZURJQM";
char pswd[] = "121121121";

// 新建组件对象
BlinkerButton Button1("btn-abc");

// 按下按键即会执行该函数
void button1_callback(const String & state) {
    BLINKER_LOG("get button state: ", state);
    digitalWrite(LED_BUILTIN, !digitalRead(LED_BUILTIN));
    Blinker.vibrate();
}

void setup() {
    // 初始化串口，并开启调试信息
    Serial.begin(115200);    
    BLINKER_DEBUG.stream(Serial);
    // 初始化有LED的IO
    pinMode(LED_BUILTIN, OUTPUT);
    digitalWrite(LED_BUILTIN, HIGH);
    // 初始化blinker
    Blinker.begin(auth, ssid, pswd);
    Button1.attach(button1_callback);
}

void loop() {
    Blinker.run();
}
