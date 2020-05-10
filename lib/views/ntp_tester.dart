import 'dart:async';
import 'package:clock_checker/models/ntp_server.dart';
import 'package:clock_checker/models/time_sources.dart';
import 'package:clock_checker/views/ntp_add_dialog.dart';
import 'package:clock_checker/views/ntp_server_mainlist.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class NTPTester extends StatefulWidget {
  @override
  _NTPTesterState createState() => _NTPTesterState();
}

class _NTPTesterState extends State<NTPTester> {
  String systemTime = TimeSources.getSystemTimeToString();
  String ntpTime = '';
  Timer _timer;
  String testServerEntry = '';

  _NTPTesterState() {
    Timer.periodic(Duration(milliseconds: 1000), (_timer) {
      setState(() {
        this.systemTime = TimeSources.getSystemTimeToString();
        if (!(TimeSources.currentNTPserver == null)) {
          ntpTime = TimeSources.getNTPTimeToString();
        } else {
          ntpTime = '';
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _testServerController.dispose();
    super.dispose();
  }

  final TextEditingController _testServerController =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      'Data from NTP Server',
                      style: TextStyle(fontSize: 25),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Text(
                      'NTP server address:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Text(
                      '${!(TimeSources.currentNTPserver == null) ? TimeSources.currentNTPserver.getfqdnOrIPaddress() : ''}',
                      style: TextStyle(fontSize: 15),
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
                      'My time:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      '$systemTime',
                      style: TextStyle(fontSize: 15),
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
                      'NTP time:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      '$ntpTime',
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Text(
                      'Difference with system time:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Text(
                      '${TimeSources.currentNTPoffset} ms',
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                      width: 250,
                      child: TextField(
                        enabled: true,
                        maxLength: 30,
                        controller: _testServerController,
                        style: TextStyle(color: Colors.red),
                        obscureText: false,
                        onChanged: (String e) =>
                            setState(() => testServerEntry = e),
                      )),
                  GestureDetector(
                    onTap: () {
                      print('Entry: $testServerEntry');
                      if (isFQDN(testServerEntry) || isIP(testServerEntry)) {
                        TimeSources.currentNTPserver =
                            NTPServer.custom(testServerEntry, 'custom entry');
                        TimeSources.getNTPOffsetForLocal().then((value) {
                          if (TimeSources.isExceptionCaught) {
                            SnackBar snack = SnackBar(
                              content: Text('Error: unreachable NTP server.'),
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: () {
                                },
                              ),
                            );
                            Scaffold.of(context).showSnackBar(snack);
                            TimeSources.isExceptionCaught = false;
                          }
                        });

                        TimeSources.updateNTPTime();
                        setState(() {});
                      } else {
                        SnackBar snack = SnackBar(
                          content: Text(
                              'Invalid data, enter FQDN or an IP address.'),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {
                            },
                          ),
                        );
                        Scaffold.of(context).showSnackBar(snack);
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.red),
                      child: Center(
                        child: Text('Test server'),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NTPServerGUIList()));
                },
                child: Container(
                  height: 40,
                  margin: EdgeInsets.fromLTRB(100, 10, 100, 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.red),
                  child: Center(
                    child: Text('Choose NTP server'),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 10),
                    child: Text(
                      'Add your server to the list:',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => NTPAddDialog())),
                child: Container(
                  height: 40,
                  margin: EdgeInsets.fromLTRB(60, 10, 60, 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.red),
                  child: Center(
                    child: Text('Add a new NTP server'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
