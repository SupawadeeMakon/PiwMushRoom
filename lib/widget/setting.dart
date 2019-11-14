import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  // Field

  // Method

  Widget humidityHigh() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4, //รักษาขนาดจอ
      child: TextFormField(
        keyboardType: TextInputType.number, //บังคับให้กรอกแต่ตัวเลข
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
            labelText: 'Humidity_High'),
      ),
    );
  }

  Widget humidityLow() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4, //รักษาขนาดจอ
      child: TextFormField(
        keyboardType: TextInputType.number, //บังคับให้กรอกแต่ตัวเลข
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
            labelText: 'Humidity_Low'),
      ),
    );
  }

  Widget suitableHumi() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4, //รักษาขนาดจอ
      child: TextFormField(
        keyboardType: TextInputType.number, //บังคับให้กรอกแต่ตัวเลข
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
            labelText: 'Suitable_Humi'),
      ),
    );
  }

  Widget suitableTem() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4, //รักษาขนาดจอ
      child: TextFormField(
        keyboardType: TextInputType.number, //บังคับให้กรอกแต่ตัวเลข
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
            labelText: 'Suitable_Tem'),
      ),
    );
  }

  Widget tempHigh() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4, //รักษาขนาดจอ
      child: TextFormField(
        keyboardType: TextInputType.number, //บังคับให้กรอกแต่ตัวเลข
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
            labelText: 'Temp_High'),
      ),
    );
  }

  Widget tempLow() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4, //รักษาขนาดจอ
      child: TextFormField(
        keyboardType: TextInputType.number, //บังคับให้กรอกแต่ตัวเลข
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
            labelText: 'Temp_Low'),
      ),
    );
  }

  Widget rowTop() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        humidityHigh(),
        SizedBox(
          width: 8.0,
        ),
        humidityLow(),
      ],
    );
  }

  Widget rowMedile() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        tempHigh(),
        SizedBox(
          width: 8.0,
        ),
        tempLow(),
      ],
    );
  }

  Widget rowButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        suitableHumi(),
        SizedBox(
          width: 8.0,
        ),
        suitableTem(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 40.0,
      ),
      color: Colors.pink.shade200,
      child: Column(
        children: <Widget>[
          rowTop(),
          SizedBox(
            height: 16.0,
          ),
          rowMedile(),
          SizedBox(
            height: 16.0,
          ),
          rowButton(),
        ],
      ),
    );
  }
}
