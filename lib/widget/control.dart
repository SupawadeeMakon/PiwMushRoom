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
        'mode=$modeBool,fog=$fanBool,fan=$fanBool,water=$waterBool,light=$lightBool');
  }

  Widget switchMode() {
    return Container(
      child: Card(color: Colors.red.shade300,
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
      // fanBool = value;
      // fogBool = value;
      // waterBool = value;
      // lightBool = value;

      print('modeBool=$modeBool');
      // print('modeBool=$fogBool');
      // print('modeBool=$fanBool');
      // print('modeBool=$waterBool');
      // print('modeBool=$lightBool');
      
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
