import 'package:clock_checker/models/ntp_server.dart';
import 'package:clock_checker/models/time_sources.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

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
      Navigator.of(context).pop();
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
                validator: (input) => (isIP(input) || isFQDN(input))
                    ? null
                    : 'Invalid IP/FQDN address',
                onSaved: (input) => _addFQDNEntry = input,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                          onPressed: () {
                            _submit();
                          },
                          child: Text('Add NTP server'))),
                ],
              ),
            ]),
          ),
        )));
  }
}
