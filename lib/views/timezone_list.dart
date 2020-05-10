import 'package:clock_checker/repository/timezones.dart';
import 'package:flutter/material.dart';
import 'main_menu.dart';

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
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TimezoneAsiaList())),
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
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TimezoneUSList())),
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
            itemCount: Timezones.timezonesAfrica.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Timezones.currentLocation =
                          Timezones.timezonesAfrica.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(Timezones.timezonesAfrica
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
            itemCount: Timezones.timezonesAmerica.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Timezones.currentLocation =
                          Timezones.timezonesAmerica.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(Timezones.timezonesAmerica
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
            itemCount: Timezones.timezonesAntarctica.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Timezones.currentLocation =
                          Timezones.timezonesAntarctica.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(Timezones.timezonesAntarctica
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
            itemCount: Timezones.timezonesAsia.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Timezones.currentLocation =
                          Timezones.timezonesAsia.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(Timezones.timezonesAsia
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
            itemCount: Timezones.timezonesAtlantic.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Timezones.currentLocation =
                          Timezones.timezonesAtlantic.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(Timezones.timezonesAtlantic
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
            itemCount: Timezones.timezonesAustralia.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Timezones.currentLocation =
                          Timezones.timezonesAustralia.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(Timezones.timezonesAustralia
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
            itemCount: Timezones.timezonesCanada.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Timezones.currentLocation =
                          Timezones.timezonesCanada.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(Timezones.timezonesCanada
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
            itemCount: Timezones.timezonesEurope.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Timezones.currentLocation =
                          Timezones.timezonesEurope.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(Timezones.timezonesEurope
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
            itemCount: Timezones.timezonesIndian.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Timezones.currentLocation =
                          Timezones.timezonesIndian.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(Timezones.timezonesIndian
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
            itemCount: Timezones.timezonesPacific.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Timezones.currentLocation =
                          Timezones.timezonesPacific.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(Timezones.timezonesPacific
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
            itemCount: Timezones.timezonesUS.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Timezones.currentLocation =
                          Timezones.timezonesUS.elementAt(index);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                    title: Text(Timezones.timezonesUS
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
