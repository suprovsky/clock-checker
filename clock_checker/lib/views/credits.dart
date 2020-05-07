import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Credits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Credits')),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 50),
                  child: Text('This app has been made by:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      )),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: Border.all(
                            color: Colors.redAccent,
                            width: 8.0,
                          ),
                        ),
                        child: Image.asset('assets/horakhty_avatar.png',
                            scale: 5.5)), //TODO: make image square rounded
                    InkWell(
                        onTap: () => launch('https://github.com/suprovsky'),
                        child: Text('suprovsky',
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 30,
                                decoration: TextDecoration.underline))),
                    Text('Radosław Serba',
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: Border.all(
                            color: Colors.blueAccent,
                            width: 8.0,
                          ),
                        ),
                        child: Image.asset('assets/bigfrog2_cropped.jpg',
                            scale: 5.5)), //TODO: make image square rounded
                    InkWell(
                      onTap: () =>
                          launch('https://www.youtube.com/watch?v=d6YnSXVKUiw'),
                      child: Text('     -     ',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 30,
                              decoration: TextDecoration.underline)),
                    ),
                    Text('Piotr Dyduch',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ))
                  ],
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: RaisedButton(
                    child: Text('Project page on GitHub'),
                    onPressed: () =>
                        launch('https://github.com/suprovsky/clock-checker')))
          ],
        ),
      ),
    );
  }
}
