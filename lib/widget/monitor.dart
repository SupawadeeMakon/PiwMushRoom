import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class Monitor extends StatefulWidget {
  @override
  _MonitorState createState() => _MonitorState();
}

class _MonitorState extends State<Monitor> {
  // Field
  String url1 =
          'https://thingspeak.com/channels/437885/charts/1?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line',
      url2 =
          'https://thingspeak.com/channels/662286/charts/1?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15',
      url3 =
          'https://thingspeak.com/channels/437885/charts/2?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line',
      url4 =
          'https://thingspeak.com/channels/662286/charts/2?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=15',
      humiGageUrl = 'https://thingspeak.com/channels/662286/widgets/93495',
      temGageUrl = 'https://thingspeak.com/channels/662286/widgets/93565',
      kala = 'https://www.youtube.com/watch?v=Rekg4cRalz8',
      currentGraph = 'https://www.androidthai.in.th';

  String test1 = 'https://www.androidthai.in.th/pint/test1.html';
  // String test2 = 'https://www.androidthai.in.th';

  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  Widget showAllGade() {
    return Container(
      // padding: EdgeInsets.all(20.0),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[],
      ),
    );
  }

  Widget showTestWebView() {
    flutterWebviewPlugin.launch(
      humiGageUrl,
    );

    return WebviewScaffold(
      url: url1,
      hidden: true,
      withJavascript: true,
      withZoom: false,
      initialChild: Container(
        child: Center(
          child: Text(''),
        ),
      ),
    );
  }

  //Create url Button 4 button

  Widget url1Button() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        RaisedButton(
          child: Text('Url1'),
          onPressed: () {
            setState(() {
              currentGraph = kala;
              flutterWebviewPlugin.reloadUrl(currentGraph);
            });
          },
        )
      ],
    );
  }

  Widget url2Button() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        RaisedButton(
          child: Text('temGageUrl'),
          onPressed: () {
            setState(() {
              currentGraph = temGageUrl;
              flutterWebviewPlugin.reloadUrl(currentGraph);
            });
          },
        )
      ],
    );
  }

  Widget buttonRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[url1Button(), url2Button()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional(0.0, 1.0),
        child: Container(
            color: Colors.green,
            constraints: BoxConstraints.expand(
              width: 300.0,
              height: 300.0,
            ),
            child: Stack(
              children: <Widget>[
                //showTestWebView(),
                buttonRow(),
              ],
            )),
      ),
    );
  }
}
