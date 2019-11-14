class IotModel {
  // Field
  int suitableTem,
      water,
      suitableHumi,
      light,
      fog,
      tempHigh,
      humidityHigh,
      fan,
      mode,
      humidityLow,
      tempLow;

  // Constructor
  IotModel(
      this.suitableHumi,
      this.suitableTem,
      this.fan,
      this.fog,
      this.humidityHigh,
      this.humidityLow,
      this.light,
      this.mode,
      this.tempHigh,
      this.tempLow,
      this.water);

      IotModel.formMap(Map<dynamic, dynamic> map){
        suitableHumi = map['Suitable_Humi'];
        suitableTem = map['Suitable_Tem'];
        fog = map['Fog'];
        fan = map['Fan'];
        humidityLow = map['Humidity_Low'];
        humidityHigh = map['Humidity_High'];
        light = map['Light'];
        mode = map['Mode'];
        tempHigh = map['Temp_High'];
        tempLow = map['Temp_Low'];
        water = map['Water'];
      }
}
