import 'package:clock_checker/models/time_sources.dart';
import 'package:flutter/material.dart';

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
                      TimeSources.currentNTPserver =
                          TimeSources.ntpServersList.elementAt(index);
                      TimeSources.getNTPOffsetForLocal();
                      if (TimeSources.isExceptionCaught) {
                        SnackBar snack = SnackBar(
                          content: Text('Error: unreachable NTP server.'),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );
                        Scaffold.of(context).showSnackBar(snack);
                        TimeSources.isExceptionCaught = false;
                      }
                      TimeSources.updateNTPTime();
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
