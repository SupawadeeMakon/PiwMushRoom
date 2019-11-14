import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:piwmushoom/models/iot_mode.dart';
import 'package:piwmushoom/utility/my_style.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  // Field
  IotModel iotModel;
  String humHight = '',
      humLow = '',
      suiTemp = '',
      suiHumi = '',
      temLow = '',
      temHight = '';

  final formKey = GlobalKey<FormState>();

  // Method
  @override
  initState() {
    super.initState();
    readDatabase();
  }

  Future<void> readDatabase() async {
    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
    DatabaseReference databaseReference =
        firebaseDatabase.reference().child('IoT');
    await databaseReference.once().then((DataSnapshot dataSnapshot) {
      setState(() {
        iotModel = IotModel.formMap(dataSnapshot.value);
        humHight = iotModel.humidityHigh.toString();
        humLow = iotModel.humidityLow.toString();
        suiTemp = iotModel.suitableTem.toString();
        suiHumi = iotModel.suitableHumi.toString();
        temHight = iotModel.tempHigh.toString();
        temLow = iotModel.tempLow.toString();
      });
    });
  }

  Widget humidityHigh() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4, //รักษาขนาดจอ
      child: TextFormField(
        initialValue: humHight,
        keyboardType: TextInputType.number, //บังคับให้กรอกแต่ตัวเลข
        decoration: InputDecoration(
            helperText: 'Current: $humHight',
            enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
            labelText: 'Humidity_High'),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            humHight = value.trim();
          }
        },
      ),
    );
  }

  Widget humidityLow() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4, //รักษาขนาดจอ
      child: TextFormField(
        initialValue: humLow,
        keyboardType: TextInputType.number, //บังคับให้กรอกแต่ตัวเลข
        decoration: InputDecoration(
            helperText: 'Current: $humLow',helperStyle: MyStyle().red18,
            enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
            labelText: 'Humidity_Low'),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            humLow = value.trim();
          }
        },
      ),
    );
  }

  Widget suitableHumi() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4, //รักษาขนาดจอ
      child: TextFormField(
        initialValue: suiHumi,
        keyboardType: TextInputType.number, //บังคับให้กรอกแต่ตัวเลข
        decoration: InputDecoration(
            helperText: 'Current: $suiHumi',
            enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
            labelText: 'Suitable_Humi'),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            suiHumi = value.trim();
          }
        },
      ),
    );
  }

  Widget suitableTem() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4, //รักษาขนาดจอ
      child: TextFormField(
        initialValue: suiTemp,
        keyboardType: TextInputType.number, //บังคับให้กรอกแต่ตัวเลข
        decoration: InputDecoration(
            helperText: 'Current: $suiTemp',
            enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
            labelText: 'Suitable_Tem'),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            suiTemp = value.trim();
          }
        },
      ),
    );
  }

  Widget tempHigh() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4, //รักษาขนาดจอ
      child: TextFormField(
        initialValue: temHight,
        keyboardType: TextInputType.number, //บังคับให้กรอกแต่ตัวเลข
        decoration: InputDecoration(
            helperText: 'Current: $temHight',
            enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
            labelText: 'Temp_High'),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            temHight = value.trim();
          }
        },
      ),
    );
  }

  Widget tempLow() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4, //รักษาขนาดจอ
      child: TextFormField(
        initialValue: temLow,
        keyboardType: TextInputType.number, //บังคับให้กรอกแต่ตัวเลข
        decoration: InputDecoration(
            helperText: 'Current: $temLow',
            enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
            labelText: 'Temp_Low'),
        onSaved: (String value) {
          if (value.isNotEmpty) {
            temLow = value.trim();
          }
        },
      ),
    );
  }


  Widget uploadValue() {
    return RaisedButton.icon(
      icon: Icon(Icons.cloud_upload),
      label: Text('Upload Value'),
      onPressed: () {
        formKey.currentState.save();
        editDatabase();
        // setState(() {

        // });
      },
    );
  }

  Future<void> editDatabase() async {
    print(
        'hH=$humHight,hL=$humLow,sH=$suiHumi,sT=$suiTemp,tH=$temHight,tL=$temLow');
    IotModel myIotModel = IotModel(
        int.parse(suiHumi),
        int.parse(suiTemp),
        iotModel.fan,
        iotModel.fog,
        int.parse(humHight),
        int.parse(humLow),
        iotModel.light,
        iotModel.mode,
        int.parse(temHight),
        int.parse(temLow),
        iotModel.water);

    Map map = myIotModel.toMap();
    print('map=$map');

    FirebaseDatabase firebaseDatabase =FirebaseDatabase.instance;
    DatabaseReference databaseReference = firebaseDatabase.reference().child('IoT');
    await databaseReference.set(map).then((response){
      readDatabase();
    });
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
    return SingleChildScrollView(
      //สั่งให้ scroll ได้
      child: Container(
        padding: EdgeInsets.only(
          top: 40.0,
        ),
        color: Colors.pink.shade200,
        child: Form(
          key: formKey,
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
              SizedBox(
                height: 16.0,
              ),
              uploadValue(),
            ],
          ),
        ),
      ),
    );
  }
}
