//สร้างthrean


import 'package:flutter/material.dart';
import 'package:piwmushoom/utility/my_style.dart';

Widget showTitle(String title) {
  return ListTile(
    leading: Icon(
      Icons.add_alert,
      size: 36.0,
      color: Colors.red,
    ),
    title: Text(
      title,
      style: MyStyle().red18,
    ),
  );
}

Widget okButton(BuildContext context) {
  return FlatButton(
    child: Text('OK'),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
}

Future<void> normalDialog(
    BuildContext context, String title, String message) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: showTitle(title),
          content: Text(message),
          actions: <Widget>[okButton(context)], //ปุ่มกด
        );
      });
}
