import 'dart:async';

import 'package:clock_checker/models/data_sources.dart';
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
  String systemTime = readTimeLikeAHuman();
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        this.systemTime = readTimeLikeAHuman();
      });
    });
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Ubuntu'),
        home: Builder(
          builder: (context) => DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  actions: <Widget>[
                    IconButton(icon: Icon(Icons.info),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Credits())); //TODO: implement getting choice from list
                          
                    }),
                  ],
                    centerTitle: true,
                    title: Text('Clock Checker'),
                    bottom: TabBar(tabs: [
                      Tab(icon: Icon(Icons.access_time), text: 'check time'),
                      Tab(icon: Icon(Icons.router), text: 'ntp tester'),
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
                                'Time from chosen NTP Server:',
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
                                'Address: choosedNTPServer',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                child: Text('$systemTime', //TODO: implement getting time from timeserver
                                    style: TextStyle(fontSize: 30)))
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NTPServerList())); //TODO: implement getting choice from list
                          },
                          child: Container(
                            height: 40,
                            margin: EdgeInsets.fromLTRB(80, 10, 80, 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.red),
                            child: Center(
                              child: Text('Change NTP Server'),
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
                                child: Text('chosenTimezone', //TODO: insert timezone
                                    style: TextStyle(fontSize: 30)))
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NTPServerList())); //TODO: implement list (timezones)
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
                  DataSources()
                ]),
              )),
        ));
  }
}

class NTPServerList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NTPServerList();
}

class _NTPServerList extends State<NTPServerList> {
  @override
  Widget build(BuildContext context) {
    TimeSources t;
    return Scaffold(
        appBar: AppBar(
          title: Text('Timezones'),
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    print('clicked ' + t.getLocationsList().elementAt(index));
                  },
                  title: Text("firstentry"),
                ),
              );
            }));
  }
}
