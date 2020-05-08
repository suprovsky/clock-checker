import 'dart:async';

import 'package:clock_checker/models/data_sources.dart';
import 'package:flutter/material.dart';
import 'credits.dart';
import '../views/ntp_tester.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class MainMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainMenu();
  }
}

class _MainMenu extends State<MainMenu> {
  String systemTime = readTimeLikeAHuman();
_MainMenu(){
          Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        this.systemTime = readTimeLikeAHumanTest(
            tz.TZDateTime.now(tz.getLocation(TimeSources.currentLocation)));
      });
    });
}

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        theme: ThemeData(fontFamily: 'Ubuntu'),
        home: Builder(
          builder: (context) => DefaultTabController(
              length: 2,
              child: Scaffold(
                //
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
                    bottom: TabBar(tabs: [
                      Tab(icon: Icon(Icons.access_time), text: 'check time'),
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
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
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
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
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
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    child: Text(
                                        '$systemTime', //TODO: implement getting time from timeserver
                                        style: TextStyle(fontSize: 30)))
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        NTPServerGUIList())); //TODO: implement getting choice from list
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
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
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
                                        TimeSources
                                            .currentLocation, //TODO: insert timezone after reimplementation of the timezone list
                                        style: TextStyle(fontSize: 30)))
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        TimezoneGUIList())); //TODO: reimplement list (timezones), 426 elements are too much
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

class TimezoneGUIList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TimezoneGUIList();
}

class _TimezoneGUIList extends State<TimezoneGUIList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Timezones'),
        ),
        body: ListView.builder(
            itemCount: TimeSources.locationsList.length,
            itemBuilder: (BuildContext context, int index) {
              String key = TimeSources.locationsList.elementAt(index);
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      TimeSources.currentLocation = key;
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(key),
                  ),
                  Divider(height: 2.0)
                ],
              );
            }));
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
            itemCount: TimeSources.ntpServers.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      TimeSources.currentNTPserver = TimeSources.ntpServers.elementAt(index).getfqdnOrIPaddress();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(TimeSources.ntpServers.elementAt(index).getserverName()),
                    subtitle: Text(TimeSources.ntpServers.elementAt(index).getfqdnOrIPaddress()),
                    leading: CircleAvatar(backgroundImage: TimeSources.ntpServers.elementAt(index).getFlag()),
                  ),
                  Divider(height: 2.0)
                ],
              );
            }));
  }
}
