import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:piwmushoom/screens/home.dart';
import 'package:piwmushoom/utility/my_style.dart';
import 'package:piwmushoom/widget/add_display_name.dart';
import 'package:piwmushoom/widget/control.dart';
import 'package:piwmushoom/widget/home_services.dart';
import 'package:piwmushoom/widget/monitor.dart';
import 'package:piwmushoom/widget/page2.dart';
import 'package:piwmushoom/widget/page3.dart';
import 'package:piwmushoom/widget/setting.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  //Field
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String login = '...';
  Widget currentWidget = HomeService();

  //Method

  Widget hambergerButton() {
    return IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {
        scaffoldKey.currentState.openDrawer();
      },
    );
  }

  Widget showDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          showHead(),
          menuHome(),
          menuAddDisplayName(),
          menuPage2(),
          menuPage3(),
          menuSignOut(),
        ],
      ),
    );
  }

  Widget showHead() {
    return DrawerHeader(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/wall.jpg'), fit: BoxFit.cover)),
      child: Column(
        children: <Widget>[
          showLogo(),
          showAppName(),
          showLogin(),
        ],
      ),
    );
  }

  Widget showLogo() {
    return Container(
      height: 80.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Piw MushRoom',
      style: TextStyle(color: Colors.white),
    );
  }

  Widget showLogin() {
    return Text(
      'Login by $login',
      style: TextStyle(color: Colors.white),
    );
  }

  Widget menuAddDisplayName() {
    return ListTile(
      leading: Icon(Icons.filter_1),
      title: Text('Add Display Name'),
      subtitle: Text('Add of Change Display Name'),
      onTap: () {
        Navigator.of(context).pop();
        setState(() {
          currentWidget = AddDisplayName();
        });
      },
    );
  }

  Widget menuPage2() {
    return ListTile(
      leading: Icon(Icons.filter_1),
      title: Text('Add menuPage2 Name'),
      subtitle: Text('Add of Change menuPage2 Name'),
      onTap: () {
        Navigator.of(context).pop();
        setState(() {
          currentWidget = Page2State();
        });
      },
    );
  }

  Widget menuPage3() {
    return ListTile(
      leading: Icon(Icons.filter_1),
      title: Text('Add menuPage3 Name'),
      subtitle: Text('Add of Change menuPage3 Name'),
      onTap: () {
        Navigator.of(context).pop();
        currentWidget = Page3State();
      },
    );
  }

  Widget menuSignOut() {
    return ListTile(
      leading: Icon(Icons.filter_1),
      title: Text('Log Out'),
      subtitle: Text('Log Out and Back Authen'),
      onTap: () {
        Navigator.of(context).pop();
        processLogOut();
      },
    );
  }

  //ติดต่อfirebaseเพื่อlogout

  Future<void> processLogOut() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((response) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
      Navigator.of(context).pushAndRemoveUntil(materialPageRoute,
          (Route<dynamic> route) {
        return false;
      });
      //Navigator.of(context).pushAndRemoveUntil(materialPageRoute, (Route<dynamic> route){return false;))
    });
  }

  Widget menuHome() {
    return ListTile(
      leading: Icon(Icons.filter_1),
      title: Text('Home'),
      subtitle: Text('Dricrution Home'),
      onTap: () {
        Navigator.of(context).pop();

        setState(() {
          currentWidget = HomeService();
        });
      },
    );
  }

  Widget tabsMonitor() {
    return Tab(
      icon: Icon(Icons.airplay),
      text: 'Monitor',
    );
    //return Icon(Icons.android);
  }

  Widget tabsControl() {
    return Tab(
      icon: Icon(Icons.screen_lock_portrait),
      text: 'Control',
    );
    //return Icon(Icons.android);
  }

  Widget tabsSetting() {
    return Tab(
      icon: Icon(Icons.settings),
      text: 'Setting',
    );
    //return Icon(Icons.android);
  }

  Widget showTabController() {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: hambergerButton(),
            backgroundColor: MyStyle().textColor,
            title: Text('My Service'),
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 6.0,
              tabs: <Widget>[tabsMonitor(), tabsControl(), tabsSetting()],
            ),
          ),
          body: TabBarView(
            children: <Widget>[Monitor(), Control(), Setting()],
          ),
        )
        //child: Text('This is TabController'),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
      ),
      key: scaffoldKey,
      body: currentWidget, //showTabController(),
      drawer: showDrawer(),
    );
  }
}
