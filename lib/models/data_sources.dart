import 'dart:async';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;


class TimeSources {
  Map<String, tz.Location> locations;
  List<String> locationsList;
  TimeSources()
  {
    tz.initializeTimeZones();
    this.locations = tz.timeZoneDatabase.locations;
    print(this.locations.length);
    this.locationsList = locations.keys.toList();
    print(this.locationsList.length);
  }
  Map<String, tz.Location> getLocations()
  {
    return this.locations;
  }
  List<String> getLocationsList()
  {
    return this.locationsList;
  }
}

void getNTPTime() async {
  DateTime _myTime;
  DateTime _ntpTime;
  /// Or you could get NTP current (It will call DateTime.now() and add NTP offset to it)
  _myTime = await NTP.now();
  // var warsaw = tz.getLocation('Europe/Warsaw');
  // var timezonedTime = tz.TZDateTime.now(tz.getLocation('Europe/Warsaw'));
  
  /// Or get NTP offset (in milliseconds) and add it yourself
  final int offset = await NTP.getNtpOffset(localTime: DateTime.now());
  _ntpTime = _myTime.add(Duration(milliseconds: offset));
Timer.periodic(Duration(seconds: 1), (timer) {
  readTimeLikeAHuman();
});
/*  Timer.periodic(second, readTimeLikeAHuman(_myTime)); */
  print('My time: $_myTime');
  print('NTP time: $_ntpTime');
  print('Difference: ${_myTime.difference(_ntpTime).inMilliseconds}ms');
}

String readTimeLikeAHuman() {
  return DateFormat("E, d MMMM y, HH:mm:ss").format(DateTime.now()).toString();
}