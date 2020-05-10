import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class Timezones {
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

  Timezones() {
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

  void sortLocations() => locationsList.forEach((element) {
        if (element.toString().startsWith('Africa')) {
          timezonesAfrica.add(element);
        }
        if (element.toString().startsWith('Asia')) {
          timezonesAsia.add(element);
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
}
