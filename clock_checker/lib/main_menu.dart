import 'dart:async';

import 'package:clock_checker/data_sources.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'credits.dart';
import 'data_changer.dart';

class MainMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainMenu();
  }
}

class _MainMenu extends State<MainMenu> {
  String systemTime = readTimeLikeAHuman();
  TextEditingController _controller;
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        this.systemTime = readTimeLikeAHuman();
      });
      
    });
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Ubuntu'),
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                  centerTitle: true,
                  title: Text('Clock Checker'),
                  bottom: TabBar(tabs: [
                    Tab(icon: Icon(Icons.access_time), text: 'check time'),
                    Tab(icon: Icon(Icons.settings), text: 'settings'),
                    Tab(icon: Icon(Icons.accessible), text: 'credits'),
                  ])),
              body: TabBarView(children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 30, 0, 15),
                              child: Text(
                                'Welcome in the Clock Checker app!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            )
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'System time:',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Container(child: Text('$systemTime', style: TextStyle(fontSize: 30)))],
                      )
                    ]),
                DataSources(),
                Credits()
              ]),
            )));
  }
}
