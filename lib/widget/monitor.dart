import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';

class Monitor extends StatefulWidget {
  @override
  _MonitorState createState() => _MonitorState();
}

class _MonitorState extends State<Monitor> {
  /*
  //Field
  String gateTemp =
      'https://thingspeak.com/channels/662286/widgets/93565?fbclid=IwAR3Gq2zONKLjqkD6ACcCJE8m5Z9d_kdW92kUBOFdAdYgyAGQYtVOWpi8bJo';

  //Method

  Widget showWebview(String url) {
    return Container(
      width: 200.0,
      height: 200.0,
      child: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted, //ข้อมูลมาจากtinkspake
      ),
    );
  }

  Widget showAllGade() {
    return Container(
      //padding: EdgeInsets.all(20.0),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[showWebview(gateTemp)],
      ),
    );
    
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.pink.shade300,
        child: Center(
      child: Text('Monitor'),
    ));
  }
}
