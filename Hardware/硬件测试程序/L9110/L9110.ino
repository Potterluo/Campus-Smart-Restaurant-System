#define  IA  D5  //  pin 8 connected to pin IA
#define IB  D2  //  pin 9 connected to pin IB
byte speed = 255 ;  // L9110转速设为255

void setup() 
{
  //初始化
  Serial.begin(9600); //设置波特率为9600
  pinMode(IA, OUTPUT); // 定义IA脚输出
  pinMode(IB, OUTPUT); // 定义IB脚输出
  
}
void loop() 
{
  backward();
  delay(1000);
  forward();
  delay(1000);
  
}
void backward()
{
  analogWrite(IA, 0);
  analogWrite(IB, speed);
}
void forward()
{
  analogWrite(IA, speed);
  analogWrite(IB, 0);
}
