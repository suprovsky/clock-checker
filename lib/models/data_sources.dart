import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NTPServer {
  AssetImage flag;
  String fqdnOrIPaddress;
  String serverName;
  bool customEntry;
  NTPServer.custom(String fqdnOrIPaddress) {
    flag = AssetImage('assets/int_flag.png');
    this.fqdnOrIPaddress = fqdnOrIPaddress;
    serverName = 'custom NTP server entry';
    customEntry = true;
  }
  NTPServer(AssetImage flag, String fqdnOrIPaddress, String serverName) {
    this.flag = flag;
    this.fqdnOrIPaddress = fqdnOrIPaddress;
    this.serverName = serverName;
    customEntry = false;
  }
  AssetImage getFlag() {
    return this.flag;
  }

  String getfqdnOrIPaddress() {
    return this.fqdnOrIPaddress;
  }

  String getserverName() {
    return this.serverName;
  }
}

class TimeSources {
  static Map<String, tz.Location> locations;
  static List<String> locationsList;
  static String currentLocation;
  static List<String> timezonesAfrica = [];
  static List<String> timezonesAmerica = [];
  static List<String> timezonesAntarctica = [];
  static List<String> timezonesAsia = [];
  static List<String> timezonesAtlantic = [];
  static List<String> timezonesAustralia = [];
  static List<String> timezonesCanada = [];
  static List<String> timezonesEurope = [];
  static List<String> timezonesIndian = [];
  static List<String> timezonesPacific = [];
  static List<String> timezonesUS = [];
  TimeSources() {
    tz.initializeTimeZones();
    locations = tz.timeZoneDatabase.locations;
    locationsList = locations.keys.toList();
    currentLocation = 'Europe/Warsaw';
    sortLocations();
  }
  Map<String, tz.Location> getLocations() {
    return locations;
  }

  List<String> getLocationsList() {
    return locationsList;
  }

  static String currentNTPserver = "pl.pool.ntp.org";

  void sortLocations() => locationsList.forEach((element) {

      if (element.toString().startsWith('Africa')) {
        timezonesAfrica.add(element);
      }
      if (element.toString().startsWith('America')) {
        timezonesAmerica.add(element);
      }
      if (element.toString().startsWith('Antarctica')) {
        timezonesAntarctica.add(element);
      }
      if (element.toString().startsWith('Atlantic')) {
        timezonesAtlantic.add(element);
      }
      if (element.toString().startsWith('Australia')) {
        timezonesAustralia.add(element);
      }
      if (element.toString().startsWith('Canada')) {
        timezonesCanada.add(element);
      }
      if (element.toString().startsWith('Europe')) {
        timezonesEurope.add(element);
      }
      if (element.toString().startsWith('Indian')) {
        timezonesIndian.add(element);
      }
      if (element.toString().startsWith('Pacific')) {
        timezonesPacific.add(element);
      }
      if (element.toString().startsWith('US')) {
        timezonesUS.add(element);
      }
    });
  

  static List<NTPServer> ntpServers = [
    NTPServer(AssetImage('icons/flags/png/us.png', package: 'country_icons'),
        'time.google.com', 'Google Public NTP'),
    NTPServer(AssetImage('icons/flags/png/us.png', package: 'country_icons'),
        'time.cloudflare.com', 'Cloudflare NTP'),
    NTPServer(AssetImage('icons/flags/png/nl.png', package: 'country_icons'),
        'time.facebook.com', 'Facebook NTP'),
    NTPServer(AssetImage('icons/flags/png/us.png', package: 'country_icons'),
        'time.windows.com', 'Microsoft NTP'),
    NTPServer(AssetImage('icons/flags/png/us.png', package: 'country_icons'),
        'time.apple.com', 'Apple NTP'),
    NTPServer(AssetImage('icons/flags/png/pl.png', package: 'country_icons'),
        'tempus1.gum.gov.pl', 'Główny Urząd Miar w Polsce - server 1'),
    NTPServer(AssetImage('icons/flags/png/pl.png', package: 'country_icons'),
        'tempus2.gum.gov.pl', 'Główny Urząd Miar w Polsce - server 2'),
    NTPServer(AssetImage('icons/flags/png/us.png', package: 'country_icons'),
        'time.nist.gov', 'National Institute of Standards and Technology'),
    NTPServer(AssetImage('icons/flags/png/ad.png', package: 'country_icons'),
        'ad.pool.ntp.org', 'Andorra - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/ax.png', package: 'country_icons'),
        'at.pool.ntp.org', 'Aland Islands - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/ba.png', package: 'country_icons'),
        'ba.pool.ntp.org', 'Bosnia and Herzegovina - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/be.png', package: 'country_icons'),
        'be.pool.ntp.org', 'Belgium - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/bg.png', package: 'country_icons'),
        'bg.pool.ntp.org', 'Bulgaria - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/by.png', package: 'country_icons'),
        'by.pool.ntp.org', 'Belarus - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/ch.png', package: 'country_icons'),
        'ch.pool.ntp.org', 'Switzerland - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/cz.png', package: 'country_icons'),
        'cz.pool.ntp.org', 'Czech Republic - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/de.png', package: 'country_icons'),
        'de.pool.ntp.org', 'Germany - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/dk.png', package: 'country_icons'),
        'dk.pool.ntp.org', 'Denmark - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/ee.png', package: 'country_icons'),
        'ee.pool.ntp.org', 'Estonia - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/es.png', package: 'country_icons'),
        'es.pool.ntp.org', 'Spain - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/fi.png', package: 'country_icons'),
        'fi.pool.ntp.org', 'Finland - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/fr.png', package: 'country_icons'),
        'fr.pool.ntp.org', 'France - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/gi.png', package: 'country_icons'),
        'gi.pool.ntp.org', 'Gibraltar - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/gr.png', package: 'country_icons'),
        'gr.pool.ntp.org', 'Greece - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/hr.png', package: 'country_icons'),
        'hr.pool.ntp.org', 'Croatia - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/hu.png', package: 'country_icons'),
        'hu.pool.ntp.org', 'Hungary - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/ie.png', package: 'country_icons'),
        'ie.pool.ntp.org', 'Ireland - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/is.png', package: 'country_icons'),
        'is.pool.ntp.org', 'Iceland - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/it.png', package: 'country_icons'),
        'it.pool.ntp.org', 'Italy - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/li.png', package: 'country_icons'),
        'li.pool.ntp.org', 'Liechtenstein - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/lt.png', package: 'country_icons'),
        'lt.pool.ntp.org', 'Lithuania - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/lv.png', package: 'country_icons'),
        'lv.pool.ntp.org', 'Latvia - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/md.png', package: 'country_icons'),
        'md.pool.ntp.org', 'Moldova - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/me.png', package: 'country_icons'),
        'me.pool.ntp.org', 'Republic of Montenegro - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/mk.png', package: 'country_icons'),
        'mk.pool.ntp.org', 'Macedonia - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/nl.png', package: 'country_icons'),
        'nl.pool.ntp.org', 'Netherlands - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/no.png', package: 'country_icons'),
        'no.pool.ntp.org', 'Norway - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/pl.png', package: 'country_icons'),
        'pl.pool.ntp.org', 'Poland - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/ro.png', package: 'country_icons'),
        'ro.pool.ntp.org', 'Romania - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/rs.png', package: 'country_icons'),
        'rs.pool.ntp.org', 'Republic of Serbia - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/ru.png', package: 'country_icons'),
        'ru.pool.ntp.org', 'Russian Federation - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/se.png', package: 'country_icons'),
        'se.pool.ntp.org', 'Sweden - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/si.png', package: 'country_icons'),
        'si.pool.ntp.org', 'Slovenia - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/sk.png', package: 'country_icons'),
        'sk.pool.ntp.org', 'Slovakia - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/tr.png', package: 'country_icons'),
        'tr.pool.ntp.org', 'Turkey - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/ua.png', package: 'country_icons'),
        'ua.pool.ntp.org', 'Ukraine - pool.ntp.org'),
    NTPServer(AssetImage('icons/flags/png/gb.png', package: 'country_icons'),
        'uk.pool.ntp.org', 'United Kingdom - pool.ntp.org'),
  ];
}

void getNTPTime() async {
  DateTime _myTime;
  DateTime _ntpTime;

  /// Or you could get NTP current (It will call DateTime.now() and add NTP offset to it)
  _myTime = await NTP.now();
  // var warsaw = tz.getLocation('Europe/Warsaw');

  /// Or get NTP offset (in milliseconds) and add it yourself
  final int offset = await NTP.getNtpOffset(localTime: DateTime.now());
  _ntpTime = _myTime.add(Duration(milliseconds: offset));
  print('My time: $_myTime');
  print('NTP time: $_ntpTime');
  print('Difference: ${_myTime.difference(_ntpTime).inMilliseconds}ms');
}

String readTimeLikeAHuman() {
  return DateFormat("E, d MMMM y, HH:mm:ss").format(DateTime.now()).toString();
}

String readTimeLikeAHumanTest(tz.TZDateTime currentTime) {
  return DateFormat("E, d MMMM y, HH:mm:ss").format(currentTime);
}
