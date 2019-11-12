import 'package:flutter/material.dart';
import 'package:piwmushoom/screens/home.dart';//ดึงthrem มาทำงานก่อน

//สร้างmethod contructor
void main (){
  runApp(MyApp());//run method
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Piw MushRoom',
      home: Home(),
      
    );
  }
}