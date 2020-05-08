import 'package:flutter/material.dart';
import '../views/main_menu.dart';

class NTPTester extends StatefulWidget {
  @override
  _NTPTesterState createState() => _NTPTesterState();
}

class _NTPTesterState extends State<NTPTester> {
  String testServerChange = '';
  String addServerChange = '';
  void _testServerSubmission(String e) {
    print(_testServerController.text);
    _testServerController.clear();
  }
    void _addServerSubmission(String e) {
    print(_testServerController.text);
    _testServerController.clear();
  }
  final TextEditingController _testServerController = new TextEditingController();
  final TextEditingController _addServerController = new TextEditingController();
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
                      style: TextStyle(color: Colors.black, fontSize: 25),
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
                      style: TextStyle(color: Colors.black, fontSize: 15),
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
                      style: TextStyle(color: Colors.black, fontSize: 15),
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
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(

                      //padding: EdgeInsets.symmetric(horizontal: 80.0),
                      width: 250,
                      child: TextField(
                        enabled: true,
                        maxLength: 30,
                        controller: _testServerController,
                        style: TextStyle(color: Colors.red),
                        obscureText: false,
                        onChanged: (String e) => setState(() => testServerChange = e), //TODO: add IP/FQDN validation here
                        onSubmitted: _testServerSubmission,
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              TimezoneGUIList())); //TODO: make it an add button
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
                      builder: (context) =>
                          NTPServerGUIList())); //TODO: implement list (timezones)
                },
                child: Container(
                  height: 40,
                  margin: EdgeInsets.fromLTRB(100, 10, 100, 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), color: Colors.red),
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
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(

                      //padding: EdgeInsets.symmetric(horizontal: 80.0),
                      width: 250,
                      child: TextField(
                        enabled: true,
                        maxLength: 30,
                        controller: _addServerController,
                        style: TextStyle(color: Colors.red),
                        obscureText: false,
                        onChanged: (String e) => setState(() => addServerChange = e), //TODO: add IP/FQDN validation here
                        onSubmitted: _addServerSubmission,
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              TimezoneGUIList())); //TODO: make it an add button
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.red),
                      child: Center(
                        child: Text('Add server'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
