import 'package:flutter/material.dart';

void main() => runApp(MainMenu());

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                  centerTitle: true,
                  title: Text('Clock Checker main menu'),
                  bottom: TabBar(tabs: [
                    Tab(text: "check time"),
                    Tab(text: "set data source"),
                    Tab(text: "credits"),
                  ])),
              body: TabBarView(children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 30, 0, 15),
                              child: Text('Welcome in the Clock Checker app!',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .display1
                                      .copyWith(
                                        color: Colors.black,
                                        fontSize: 25,
                                      )),
                            ),
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text('Let\'s check what\'s the time!',
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(
                                        color: Colors.black, fontSize: 20)),
                          )
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Container(
                        child: Text(DateTime.now().toString()),
                      )
                    ],)]),
                Text('druga karta'),
                Text('trzecia karta')
              ]),
            )));
  }
}
