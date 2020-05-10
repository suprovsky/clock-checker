import 'package:flutter/material.dart';

class NTPServer {
  AssetImage flag;
  String fqdnOrIPaddress;
  String serverName;
  int port;
  bool customEntry;
  NTPServer.custom(String fqdnOrIPaddress, String serverName) {
    flag = AssetImage('assets/int_flag.png');
    this.fqdnOrIPaddress = fqdnOrIPaddress;
    this.serverName = serverName;
    port = 123;
    customEntry = true;
  }
  NTPServer(AssetImage flag, String fqdnOrIPaddress, String serverName) {
    this.flag = flag;
    this.fqdnOrIPaddress = fqdnOrIPaddress;
    this.serverName = serverName;
    port = 123;
    customEntry = false;
  }
  AssetImage getFlag() {
    return this.flag;
  }

  String getfqdnOrIPaddress() {
    return this.fqdnOrIPaddress;
  }

  String getserverName() => this.serverName;
  bool isCustomEntry() => this.customEntry;
}
