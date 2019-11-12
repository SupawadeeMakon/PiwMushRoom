import 'package:flutter/material.dart'; //ดึงpackget material มาทำงานก่อน

class Home extends StatefulWidget {
  //ถ่ายเทดาต้า
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //สร้างสเตเลต stateless

  //ประกาศตัวแปร Field

  // สร้าง Method
  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    //สร้าง method returnค่ากลับ
    return Text(
      'โรงเรือนเห็ดแครง',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.blue[900],
        fontStyle: FontStyle.italic,
        fontFamily: 'Itim',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: Text('This is Home'),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showLogo(),
              showAppName(),
              //showAppName(),
            ],
          ),
        ),
      ),
    );
  }
}
