import 'package:flutter/material.dart';

class Control extends StatefulWidget {
  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
  //Field
  bool modeBool = false,
      fogBool = false,
      fanBool = false,
      waterBool = false,
      lightBool = false;

  //Method

  Widget switchMode() {
    return Container(
      child: Card(
        //ใส่กรอบให้switch
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            //เรียงตัวจากบนลงล่าง
            children: <Widget>[
              Text('Mode'),
              Row(
                //เรียงตัวซ้ายไปขวา
                children: <Widget>[
                  Text('Auto'),
                  Switch(
                    value: modeBool,
                    onChanged: (bool value) {
                      changeBool(value);
                    },
                  ),
                  Text('Manual')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget switchFog() {
    return Container(
      child: Card(
        //ใส่กรอบให้switch
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            //เรียงตัวจากบนลงล่าง
            children: <Widget>[
              Text('Fog'),
              Row(
                //เรียงตัวซ้ายไปขวา
                children: <Widget>[
                  Text('off'),
                  Switch(
                    value: modeBool,
                    onChanged: (bool value) {
                      changeBool(value);
                    },
                  ),
                  Text('on')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget switchFan() {
    return Container(
      child: Card(color: Colors.yellow.shade700,
        //ใส่กรอบให้switch
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            //เรียงตัวจากบนลงล่าง
            children: <Widget>[
              Text('Fan'),
              Row(
                //เรียงตัวซ้ายไปขวา
                children: <Widget>[
                  Text('off'),
                  Switch(
                    value: modeBool,
                    onChanged: (bool value) {
                      changeBool(value);
                    },
                  ),
                  Text('on')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget switchWater() {
    return Container(
      child: Card(color: Colors.yellow.shade300,
        //ใส่กรอบให้switch
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            //เรียงตัวจากบนลงล่าง
            children: <Widget>[
              Text('Water'),
              Row(
                //เรียงตัวซ้ายไปขวา
                children: <Widget>[
                  Text('off'),
                  Switch(
                    value: modeBool,
                    onChanged: (bool value) {
                      changeBool(value);
                    },
                  ),
                  Text('on')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget switchLight() {
    return Container(
      child: Card(color: Colors.yellow,
        //ใส่กรอบให้switch
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            //เรียงตัวจากบนลงล่าง
            children: <Widget>[
              Text('Light'),
              Row(
                //เรียงตัวซ้ายไปขวา
                children: <Widget>[
                  Text('off'),
                  Switch(
                    value: modeBool,
                    onChanged: (bool value) {
                      changeBool(value);
                    },
                  ),
                  Text('on')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeBool(bool value) {
    setState(() {
      modeBool = value;
      print('modeBool=$modeBool');
    });
  }

  Widget modeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[switchMode()],
    );
  }

  Widget topRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[switchFog(), switchFan()],
    );
  }

  Widget bottonRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[switchWater(), switchLight()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(//ใส่สีbackgroud
          gradient: RadialGradient(
        colors: [Colors.white, Colors.pink.shade200],
        radius: 1.0,//การกระจายสี
      )),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[modeRow(), topRow(), bottonRow()],
        ),
      ),
    );
  }
}
