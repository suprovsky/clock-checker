import 'package:flutter/material.dart';
import '../views/main_menu.dart';

class DataSources extends StatefulWidget {
  @override
  _DataSourcesState createState() => _DataSourcesState();
}

class _DataSourcesState extends State<DataSources> {
  String change = '';
  final TextEditingController _texteditcontrol = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    controller: _texteditcontrol,
                    style: TextStyle(color: Colors.red),
                    obscureText: false,
                    onChanged: (String e) => setState(() => change = e),
                    onSubmitted: _submission,
                  )),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          NTPServerList())); //TODO: make it an add button
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
                      NTPServerList())); //TODO: implement list (timezones)
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
                    controller: _texteditcontrol,
                    style: TextStyle(color: Colors.red),
                    obscureText: false,
                    onChanged: (String e) => setState(() => change = e),
                    onSubmitted: _submission,
                  )),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          NTPServerList())); //TODO: make it an add button
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
    );
  }

  void _submission(String e) {
    print(_texteditcontrol.text);
    _texteditcontrol.clear();
  }
}
