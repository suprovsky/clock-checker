import 'dart:async';
import 'package:clock_checker/models/data_sources.dart';
import 'package:clock_checker/views/timezone_list.dart';
import 'package:flutter/material.dart';
import 'credits.dart';
import '../views/ntp_tester.dart';

class MainMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainMenu();
  }
}

class _MainMenu extends State<MainMenu> {
  String systemTime = TimeSources.getSystemTimeToString();
  String ntpTime = '';
  Timer _timer;

  _MainMenu() {
    Timer.periodic(Duration(milliseconds: 500), (_timer) {
      setState(() {
        this.systemTime = TimeSources.getSystemTimeToString();

        //TODO: implement getting NTP TimeDate
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Ubuntu',
          primaryColor: Colors.red,
          accentColor: Colors.redAccent,
        ),
        home: Builder(
          builder: (context) => DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                    actions: <Widget>[
                      IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Credits()));
                          }),
                    ],
                    centerTitle: true,
                    title: Text('Clock Checker'),
                    bottom: TabBar(
                        labelColor: Colors.redAccent,
                        unselectedLabelColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            color: Colors.white),
                        tabs: [
                          Tab(
                              icon: Icon(Icons.access_time),
                              text: 'check time'),
                          Tab(icon: Icon(Icons.router), text: 'ntp tester'),
                        ])),
                body: TabBarView(children: [
                  SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    'System time:',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 40),
                                    child: Text('$systemTime',
                                        style: TextStyle(fontSize: 30)))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    'Time from chosen NTP server:',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: Text(
                                    'Address: ${TimeSources.currentNTPserver}',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    child: Text(
                                        '$ntpTime', //TODO: implement getting time from timeserver
                                        style: TextStyle(fontSize: 30)))
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => NTPServerGUIList()));
                              },
                              child: Container(
                                height: 40,
                                margin: EdgeInsets.fromLTRB(80, 10, 80, 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.red),
                                child: Center(
                                  child: Text('Change NTP server'),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 40, 10, 10),
                                  child: Text(
                                    'Times are shown for a timezone:',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Text(
                                        TimeSources.currentLocation
                                            .replaceAll('_', ' '),
                                        style: TextStyle(fontSize: 25)))
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => TimezoneGroupList()));
                              },
                              child: Container(
                                height: 40,
                                margin: EdgeInsets.fromLTRB(80, 10, 80, 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.red),
                                child: Center(
                                  child: Text('Change current timezone'),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  NTPTester()
                ]),
              )),
        ));
  }
}

class NTPServerGUIList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NTPServerGUIList();
}

class _NTPServerGUIList extends State<NTPServerGUIList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('NTP servers'),
        ),
        body: ListView.builder(
            itemCount: TimeSources.ntpServersList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onLongPress: () {
                      if (TimeSources.ntpServersList
                          .elementAt(index)
                          .isCustomEntry()) {
                        setState(() {
                          TimeSources.ntpServersList.removeAt(index);
                        });
                      }
                    },
                    onTap: () {
                      TimeSources.currentNTPserver = TimeSources.ntpServersList
                          .elementAt(index);
                      Navigator.of(context).pop();
                    },
                    title: Text(TimeSources.ntpServersList
                        .elementAt(index)
                        .getserverName()),
                    subtitle: Text(TimeSources.ntpServersList
                        .elementAt(index)
                        .getfqdnOrIPaddress()),
                    leading: CircleAvatar(
                        backgroundImage: TimeSources.ntpServersList
                            .elementAt(index)
                            .getFlag()),
                  ),
                  Divider(height: 2.0)
                ],
              );
            }));
  }
}
