import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Credits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Credits')),
      body: Container(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 50),
                      child: Text('This app has been made by:',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                            child: CircleAvatar(
                          radius: 80,
                          backgroundImage:
                              AssetImage('assets/horakhty_avatar.png'),
                        )),
                        InkWell(
                            onTap: () => launch('https://github.com/suprovsky'),
                            child: Text('suprovsky',
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 30,
                                ))),
                        Text('Radosław Serba', style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            child: CircleAvatar(
                          radius: 80,
                          backgroundImage:
                              AssetImage('assets/bigfrog2_cropped.jpg'),
                        )),
                        InkWell(
                          onTap: () => launch(
                              'https://www.youtube.com/watch?v=d6YnSXVKUiw'),
                          child: Text('     -     ',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 30,
                              )),
                        ),
                        Text('Piotr Dyduch',
                            style: TextStyle(
                              fontSize: 15,
                            ))
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () =>
                      launch('https://github.com/suprovsky/clock-checker'),
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.fromLTRB(80, 80, 80, 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.red),
                    child: Center(
                      child: Text('Project page on GitHub'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
