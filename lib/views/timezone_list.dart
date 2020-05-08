import 'package:clock_checker/models/data_sources.dart';
import 'package:flutter/material.dart';

import 'main_menu.dart';

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

class TimezoneGroupList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TimezoneGroupList();
}

class _TimezoneGroupList extends State<TimezoneGroupList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose region'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TimezoneAfricaList())),
              title: Text('Africa'),
            ),
            Divider(height: 2.0),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TimezoneAmericaList())),
              title: Text('America'),
            ),
            Divider(height: 2.0),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TimezoneAntarcticaList())),
              title: Text('Antarctica'),
            ),
            Divider(height: 2.0),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TimezoneAsiaList())),
              title: Text('Asia'),
            ),
            Divider(height: 2.0),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TimezoneAtlanticList())),
              title: Text('Atlantic'),
            ),
            Divider(height: 2.0),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TimezoneAustraliaList())),
              title: Text('Australia'),
            ),
            Divider(height: 2.0),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TimezoneCanadaList())),
              title: Text('Canada'),
            ),
            Divider(height: 2.0),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TimezoneEuropeList())),
              title: Text('Europe'),
            ),
            Divider(height: 2.0),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TimezoneIndianList())),
              title: Text('Indian'),
            ),
            Divider(height: 2.0),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TimezonePacificList())),
              title: Text('Pacific'),
            ),
            Divider(height: 2.0),
            ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TimezoneUSList())),
              title: Text('US'),
            ),
            Divider(height: 2.0),
          ],
        ));
  }
}

class TimezoneAfricaList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TimezoneAfricaList();
}

class _TimezoneAfricaList extends State<TimezoneAfricaList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Timezones in the Africa'),
        ),
        body: ListView.builder(
            itemCount: TimeSources.timezonesAfrica.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      TimeSources.currentLocation =
                          TimeSources.timezonesAfrica.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(TimeSources.timezonesAfrica
                        .elementAt(index)
                        .substring(7)
                        .replaceAll('_', ' ')),
                  ),
                  Divider(height: 2.0)
                ],
              );
            }));
  }
}

class TimezoneAmericaList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TimezoneAmericaList();
}

class _TimezoneAmericaList extends State<TimezoneAmericaList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Timezones in America'),
        ),
        body: ListView.builder(
            itemCount: TimeSources.timezonesAmerica.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      TimeSources.currentLocation =
                          TimeSources.timezonesAmerica.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(TimeSources.timezonesAmerica
                        .elementAt(index)
                        .substring(8)
                        .replaceAll('_', ' ')),
                  ),
                  Divider(height: 2.0)
                ],
              );
            }));
  }
}

class TimezoneAntarcticaList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TimezoneAntarcticaList();
}

class _TimezoneAntarcticaList extends State<TimezoneAntarcticaList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Timezones in the Antarctica'),
        ),
        body: ListView.builder(
            itemCount: TimeSources.timezonesAntarctica.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      TimeSources.currentLocation =
                          TimeSources.timezonesAntarctica.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(TimeSources.timezonesAntarctica
                        .elementAt(index)
                        .substring(11)
                        .replaceAll('_', ' ')),
                  ),
                  Divider(height: 2.0)
                ],
              );
            }));
  }
}

class TimezoneAsiaList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TimezoneAsiaList();
}

class _TimezoneAsiaList extends State<TimezoneAsiaList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Timezones in the Asia'),
        ),
        body: ListView.builder(
            itemCount: TimeSources.timezonesAsia.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      TimeSources.currentLocation =
                          TimeSources.timezonesAsia.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(TimeSources.timezonesAsia
                        .elementAt(index)
                        .substring(5)
                        .replaceAll('_', ' ')),
                  ),
                  Divider(height: 2.0)
                ],
              );
            }));
  }
}

class TimezoneAtlanticList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TimezoneAtlanticList();
}

class _TimezoneAtlanticList extends State<TimezoneAtlanticList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Timezones in the Atlantic'),
        ),
        body: ListView.builder(
            itemCount: TimeSources.timezonesAtlantic.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      TimeSources.currentLocation =
                          TimeSources.timezonesAtlantic.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(TimeSources.timezonesAtlantic
                        .elementAt(index)
                        .substring(9)
                        .replaceAll('_', ' ')),
                  ),
                  Divider(height: 2.0)
                ],
              );
            }));
  }
}

class TimezoneAustraliaList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TimezoneAustraliaList();
}

class _TimezoneAustraliaList extends State<TimezoneAustraliaList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Timezones in the Australia'),
        ),
        body: ListView.builder(
            itemCount: TimeSources.timezonesAustralia.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      TimeSources.currentLocation =
                          TimeSources.timezonesAustralia.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(TimeSources.timezonesAustralia
                        .elementAt(index)
                        .substring(10)
                        .replaceAll('_', ' ')),
                  ),
                  Divider(height: 2.0)
                ],
              );
            }));
  }
}

class TimezoneCanadaList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TimezoneCanadaList();
}

class _TimezoneCanadaList extends State<TimezoneCanadaList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Timezones in the Canada'),
        ),
        body: ListView.builder(
            itemCount: TimeSources.timezonesCanada.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      TimeSources.currentLocation =
                          TimeSources.timezonesCanada.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(TimeSources.timezonesCanada
                        .elementAt(index)
                        .substring(7)
                        .replaceAll('_', ' ')),
                  ),
                  Divider(height: 2.0)
                ],
              );
            }));
  }
}

class TimezoneEuropeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TimezoneEuropeList();
}

class _TimezoneEuropeList extends State<TimezoneEuropeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Timezones in the Europe'),
        ),
        body: ListView.builder(
            itemCount: TimeSources.timezonesEurope.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      TimeSources.currentLocation =
                          TimeSources.timezonesEurope.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(TimeSources.timezonesEurope
                        .elementAt(index)
                        .substring(7)
                        .replaceAll('_', ' ')),
                  ),
                  Divider(height: 2.0)
                ],
              );
            }));
  }
}

class TimezoneIndianList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TimezoneIndianList();
}

class _TimezoneIndianList extends State<TimezoneIndianList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Timezones in the India'),
        ),
        body: ListView.builder(
            itemCount: TimeSources.timezonesIndian.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      TimeSources.currentLocation =
                          TimeSources.timezonesIndian.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(TimeSources.timezonesIndian
                        .elementAt(index)
                        .substring(7)
                        .replaceAll('_', ' ')),
                  ),
                  Divider(height: 2.0)
                ],
              );
            }));
  }
}

class TimezonePacificList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TimezonePacificList();
}

class _TimezonePacificList extends State<TimezonePacificList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Timezones in the Pacific'),
        ),
        body: ListView.builder(
            itemCount: TimeSources.timezonesPacific.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      TimeSources.currentLocation =
                          TimeSources.timezonesPacific.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(TimeSources.timezonesPacific
                        .elementAt(index)
                        .substring(8)
                        .replaceAll('_', ' ')),
                  ),
                  Divider(height: 2.0)
                ],
              );
            }));
  }
}

class TimezoneUSList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TimezoneUSList();
}

class _TimezoneUSList extends State<TimezoneUSList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Timezones in the US'),
        ),
        body: ListView.builder(
            itemCount: TimeSources.timezonesUS.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      TimeSources.currentLocation =
                          TimeSources.timezonesUS.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(TimeSources.timezonesUS
                        .elementAt(index)
                        .substring(3)
                        .replaceAll('_', ' ')),
                  ),
                  Divider(height: 2.0)
                ],
              );
            }));
  }
}

