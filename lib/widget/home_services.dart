import 'package:flutter/material.dart';
import 'package:piwmushoom/utility/my_style.dart';
import 'package:piwmushoom/widget/setting.dart';

import 'control.dart';
import 'monitor.dart';

class HomeService extends StatefulWidget {
  @override
  _HomeServiceState createState() => _HomeServiceState();
}

class _HomeServiceState extends State<HomeService> {

  //Field


  //Method

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


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            // leading: hambergerButton(),
            backgroundColor: MyStyle().textColor,
            // title: Text('My Service'),
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 6.0,
              tabs: <Widget>[
                tabsMonitor(),
                tabsControl(),
                tabsSetting(),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Monitor(),
              Control(),
              Setting(),
            ],
          ),
        )
        //child: Text('This is TabController'),
        );
  }
}
