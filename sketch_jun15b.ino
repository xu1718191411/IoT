int sensor_pin0 = A0; //signal from the capacitive soil moisture sensor
int sensor_pin1 = A1; //signal from the capacitive soil moisture sensor


int output_value0 ;  // value of soil moisture
int output_value1 ;  // value of soil moisture

void setup() {
  Serial.begin(9600);
  pinMode(sensor_pin0, INPUT);  //setup for the soil moisture senor aka INPUT
  pinMode(sensor_pin1, INPUT);  //setup for the soil moisture senor aka INPUT
  delay(1000);  //1 second delay
}

void loop() {
  output_value0 = analogRead(sensor_pin0);     //gets the value from the soil moisture sensor
  Serial.println(output_value0); 
  output_value0 = map(output_value0,550,300,0,100); // this sets the percentage value
  
  output_value1 = analogRead(sensor_pin1);     //gets the value from the soil moisture sensor
  Serial.println(output_value1); 
  output_value1 = map(output_value1,650,350,0,100); // this sets the percentage value

  
  Serial.print("{\"moisture0\":");
  Serial.print(output_value0);    //print the percent of soil moisture - max is 33% if dipped in a cup of water

  Serial.print(",\"moisture1\":");
  Serial.print(output_value1);    //print the percent of soil moisture - max is 33% if dipped in a cup of water
  
  Serial.println("}");  
  delay(1500); //wait 1 second
}
