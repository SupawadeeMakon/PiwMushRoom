import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piwmushoom/screens/home.dart'; //ดึงthrem มาทำงานก่อน

//สร้างmethod contructor
void main() {
  runApp(MyApp()); //run method
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Piw MushRoom',
      home: Home(),
    );
  }
}
