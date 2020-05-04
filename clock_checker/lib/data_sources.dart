import 'dart:async';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';
import 'package:intl/date_symbol_data_local.dart';

void getNTPTime() async {
  DateTime _myTime;
  DateTime _ntpTime;

  /// Or you could get NTP current (It will call DateTime.now() and add NTP offset to it)
  _myTime = await NTP.now();

  /// Or get NTP offset (in milliseconds) and add it yourself
  final int offset = await NTP.getNtpOffset(localTime: DateTime.now());
  _ntpTime = _myTime.add(Duration(milliseconds: offset));
Timer.periodic(Duration(seconds: 1), (timer) {
  readTimeLikeAHuman();
});
/*  Timer.periodic(second, readTimeLikeAHuman(_myTime)); */
  //print('My time: $_myTime');
  //print('NTP time: $_ntpTime');
  //print('Difference: ${_myTime.difference(_ntpTime).inMilliseconds}ms');
}

String readTimeLikeAHuman() {
  return DateFormat("E, d MMMM y, HH:mm:ss").format(DateTime.now()).toString();
}