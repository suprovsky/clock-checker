import 'package:clock_checker/models/time_sources.dart';
import 'package:clock_checker/repository/timezones.dart';
import 'views/main_menu.dart';
import 'package:flutter/material.dart';

void main() {
  Timezones tzones = new Timezones();
  TimeSources ts = new TimeSources();
  runApp(MainMenu());
}
