import 'package:flutter/material.dart';
import 'package:piwmushoom/utility/my_style.dart';
import 'package:piwmushoom/widget/control.dart';
import 'package:piwmushoom/widget/monitor.dart';
import 'package:piwmushoom/widget/setting.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  //Field
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String login = '...';

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
        children: <Widget>[showHead()],
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
    return Text('Piw MushRoom');
  }

  Widget showLogin() {
    return Text('Login by $login');
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
      key: scaffoldKey,
      body: showTabController(),
      drawer: showDrawer(),
    );
  }
}
