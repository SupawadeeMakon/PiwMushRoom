import 'package:flutter/material.dart';
import 'package:piwmushoom/utility/my_style.dart'; //ดึงpackget material มาทำงานก่อน

class Home extends StatefulWidget {
  //ถ่ายเทดาต้า
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //สร้างสเตเลต stateless

  //ประกาศตัวแปร Field

  // สร้าง Method

  Widget loginButton() {
    return Container(
      width: 250.0,
      child: RaisedButton.icon(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: MyStyle().textColor,
        icon: Icon(
          Icons.account_circle,
          color: Colors.white,
        ),
        label: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {}, //สั่งให้ปุ่มทำงาน
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        style: TextStyle(color: MyStyle().textColor),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            size: 36.0,
            color: MyStyle().textColor,
          ),
          labelText: 'Username:',
          labelStyle: TextStyle(color: MyStyle().textColor),
          hintText: 'you@email.com',
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true,
        style: TextStyle(color: MyStyle().textColor),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            size: 36.0,
            color: MyStyle().textColor,
          ),
          labelText: 'Password:',
          labelStyle: TextStyle(color: MyStyle().textColor),
          hintText: 'More 6 Charactor',
        ),
      ),
    );
  }

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
        color: MyStyle().textColor,
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
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/wall.jpg'),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20.0),
                color: Color.fromARGB(100, 255, 255, 255),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    showLogo(),
                    SizedBox(
                      height: 16.0,
                    ),
                    showAppName(),
                    emailText(),
                    passwordText(),
                    SizedBox(
                      height: 16.0,
                    ),
                    loginButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
