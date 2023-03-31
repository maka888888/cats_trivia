import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:jiffy/jiffy.dart';

import 'app.dart';

void main() async {
  //Bloc.observer = BlockObserver();

  String localeShort = Platform.localeName.substring(0, 2);
  await Jiffy.setLocale(localeShort);
  await Hive.initFlutter();
  await Hive.openBox('cats');

  runApp(const App());
}
