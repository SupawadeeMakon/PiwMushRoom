import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:piwmushoom/screens/my_service.dart';
import 'package:piwmushoom/utility/my_dialog.dart';
import 'package:piwmushoom/utility/my_style.dart'; //ดึงpackget material มาทำงานก่อน

class Home extends StatefulWidget {
  //ถ่ายเทดาต้า
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //สร้างสเตเลต stateless

  //ประกาศตัวแปร Field
  String email, password; //ทำหน้าที่รับค่าจากการกรอกโดยผู้ใช้
  final formKey = GlobalKey<
      FormState>(); //keyต้องขึ้นต้นด้วยfinalเสมอ FormState รับข้อมูลจาก form

  // สร้าง Method

  
  @override //run ก่อน buil 2ก้าว
  void initState(){
    super.initState();
    checkState();
  }

  Future<void> checkState()async{//ดึงค่า status ว่ามีการlogin อยู่หรือไม่

    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser !=null){
      moveToMyService();

    }
  }


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
        onPressed: () {
          print('You Click Login');
          formKey.currentState.save(); //ให้ทุกอย่างที่อยู่ใน onsave ทำงาน
          print('email=$email,password=$password');
          registerThread(); //เรียกฟังก์ชัน Thread มาทำงาน
        }, //สั่งให้ปุ่มทำงาน
      ),
    );
  }

  Future<void> registerThread() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance; //สร้าง instance
    await firebaseAuth
        .signInWithEmailAndPassword(
            //รอให้ทำสำเร็จถ้าไม่สำเร็จไม่ต้องทำอะไรต่อ
            email: email,
            password: password)
        .then((var response) { //กรณีทำสำเร็จ
        moveToMyService();
    }).catchError((var response) {
      //กรณีทำไม่สำเร็จ
      print('response=$response');
      String title = response.code;
      String message = response.message;
      print('title=$title,message=$message');
      normalDialog(context, title, message);
    });
  }

  void moveToMyService() {
    MaterialPageRoute materialPageRoute =
      MaterialPageRoute(builder: (BuildContext context) {
    return MyService();
          });
    Navigator.of(context).pushAndRemoveUntil(materialPageRoute,
      (Route<dynamic> route) {
    return false;//ไม่มีเก็บค่าใดๆ
          });
  } //thread ทำงานตามคำสั่งแต่รอคอยผลลัพธ์ด้วย วนทำจนกว่าจะสำเร็จ

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
        onSaved: (String value) {
          email = value.trim();
        },
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
        onSaved: (String value) {
          password = value.trim();
        },
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
  Widget build(BuildContext context) {//ทำงานเป็นmethod แรก
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
                child: Form(
                  key: formKey,
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
      ),
    );
  }
}
