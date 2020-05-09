import 'package:clock_checker/models/data_sources.dart';
import 'package:flutter/material.dart';
import '../views/main_menu.dart';
import 'package:validators/validators.dart';

class NTPTester extends StatefulWidget {
  @override
  _NTPTesterState createState() => _NTPTesterState();
}

class _NTPTesterState extends State<NTPTester> {
  String testServerEntry = '';

  void _testServerSubmission(String e) {
    print(_testServerController.text);
    _testServerController.clear();
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
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Text(
                      'value1',
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
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      'value2',
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
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      'value3',
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
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Text(
                      'value4',
                      style: TextStyle(fontSize: 15),
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
                        onChanged: (String e) =>
                            setState(() => testServerEntry = e),
                        onSubmitted: _testServerSubmission,
                      )),
                  GestureDetector(
                    onTap: () {
                      if (isFQDN(testServerEntry) || isIP(testServerEntry)) {
                        _testServerSubmission(testServerEntry);
                        setState(() => testServerEntry = '');
                        //TODO: execute NTP server test
                      } else {
                        SnackBar(
                          //TODO: make this snackbar work
                          content: Text(
                              'Invalid data, enter FQDN or an IP address.'),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );
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
                      builder: (context) =>
                          NTPServerGUIList()));
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

class NTPAddDialog extends StatefulWidget {
  @override
  NTPAddDialog({Key key, this.title}) : super(key: key);
  final String title;
  State<StatefulWidget> createState() => _NTPAddDialog();
}

class _NTPAddDialog extends State<NTPAddDialog> {
  final formKey = GlobalKey<FormState>();
  String _addServerEntry = '';
  String _addFQDNEntry = '';

  void _submit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      TimeSources.ntpServersList
          .add(NTPServer.custom(_addFQDNEntry, _addServerEntry));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add new NTP server'),
        ),
        body: Card(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your server name here',
                  labelText: 'Server name',
                ),
                validator: (input) =>
                    (input.isEmpty) ? 'Empty server name' : null,
                onSaved: (input) => _addServerEntry = input,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter server IP or FQDN address here',
                  labelText: 'Server address (IP or FQDN)',
                ),
                validator: (input) => !(isIP(input) || isFQDN(input))
                    ? 'Invalid IP/FQDN address'
                    : null,
                onSaved: (input) => _addFQDNEntry = input,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _submit();
                          } ,
                          child: Text('Add NTP server'))),
                ],
              ),
            ]),
          ),
        )));
  }
}
