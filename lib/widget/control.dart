import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:piwmushoom/models/iot_mode.dart';

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

  int modeInt = 0, fogInt = 0, fanInt = 0, waterInt = 0, lightInt = 0;

  IotModel iotModel;

  //Method

  @override
  void initState() {
    //ทำงานก่อน buid
    super.initState();
    readDatabase();
  }

  Future<void> readDatabase() async {
    FirebaseDatabase firebaseDatabase =
        FirebaseDatabase.instance; //เรียกใช้งาน firebaseDatatbase
    DatabaseReference databaseReference = firebaseDatabase
        .reference()
        .child('IoT'); //เข้าถึงpath ในDatabaseFirebase

    await databaseReference.once().then((DataSnapshot dataSnapshot) {
      print('dataSnapshot = ${dataSnapshot.value}');
      iotModel = IotModel.formMap(dataSnapshot.value);

      /*อ่านค่าจากFirebase มาเก็บในตัวแปร*/
      modeInt = iotModel.mode;
      fogInt = iotModel.fog;
      fanInt = iotModel.fan;
      waterInt = iotModel.water;
      lightInt = iotModel.light;

      checkSwitch();
    });
  }

  void checkSwitch() {
    setState(() {
      if (iotModel.mode == 0) {
        modeBool = false;
      } else {
        modeBool = true;
      }

      if (iotModel.fog == 0) {
        fogBool = false;
      } else {
        fogBool = true;
      }

      if (iotModel.fan == 0) {
        fanBool = false;
      } else {
        fanBool = true;
      }

      if (iotModel.water == 0) {
        waterBool = false;
      } else {
        waterBool = true;
      }

      if (iotModel.light == 0) {
        lightBool = false;
      } else {
        lightBool = true;
      }
    });
    print(
        'mode=$modeBool,fog=$fogBool,fan=$fanBool,water=$waterBool,light=$lightBool');
  }

  Widget switchMode() {
    return Container(
      child: Card(
        color: Colors.red.shade300,
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
                      changeModeBool(value);
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
        color: Colors.yellow.shade600,
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
                    value: fogBool,
                    onChanged: (bool value) {
                      changeFogBool(value);
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
      child: Card(
        color: Colors.yellow.shade900,
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
                    value: fanBool,
                    onChanged: (bool value) {
                      changeFanBool(value);
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
      child: Card(
        color: Colors.amber.shade400,
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
                    value: waterBool,
                    onChanged: (bool value) {
                      changeWaterBool(value);
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
      child: Card(
        color: Colors.amber.shade700,
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
                    value: lightBool,
                    onChanged: (bool value) {
                      changeLightBool(value);
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

  Future<void> editDatabase() async {
    //ฟังก์ชันโยนค่าขึ้นFirebase

    print(
        'mode=$modeBool,fog=$fogBool,fan=$fanBool,water=$waterBool,light=$lightBool');
    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
    DatabaseReference databaseReference =
        firebaseDatabase.reference().child('IoT');

    Map<dynamic, dynamic> map = Map();

    map['Suitable_Humi'] = iotModel.suitableHumi;
    map['Suitable_Tem'] = iotModel.suitableTem;
    map['Fog'] = fogInt;
    map['Fan'] = fanInt;
    map['Humidity_Low'] = iotModel.humidityLow;
    map['Humidity_High'] = iotModel.humidityHigh;
    map['Light'] = lightInt;
    map['Mode'] = modeInt;
    map['Temp_High'] = iotModel.tempHigh;
    map['Temp_Low'] = iotModel.tempLow;
    map['Water'] = waterInt;

    //โยนขึ้น Firebase
    await databaseReference.set(map).then((response) {
      print('Edit Success');
    });
  }

  void changeModeBool(bool value) {
    setState(() {
      modeBool = value;
      if (modeBool) {
        modeInt = 1;
      } else {
        modeInt = 0;
      }
      editDatabase();
    });
  }

  void changeFogBool(bool value) {
    setState(() {
      fogBool = value;
      if (fogBool) {
        fogInt = 1;
      } else {
        fogInt = 0;
      }

      editDatabase();
    });
  }

  void changeFanBool(bool value) {
    setState(() {
      fanBool = value;
      if (fanBool) {
        fanInt = 1;
      } else {
        fanInt = 0;
      }
      editDatabase();
    });
  }

  void changeWaterBool(bool value) {
    setState(() {
      waterBool = value;
      if (waterBool) {
        waterInt = 1;
      } else {
        waterInt = 0;
      }
      editDatabase();
    });
  }

  void changeLightBool(bool value) {
    setState(() {
      lightBool = value;
      if (lightBool) {
        lightInt = 1;
      } else {
        lightInt = 0;
      }
      editDatabase();
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
      decoration: BoxDecoration(
          //ใส่สีbackgroud
          gradient: RadialGradient(
        colors: [Colors.white, Colors.pink.shade200],
        radius: 1.0, //การกระจายสี
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
