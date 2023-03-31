import 'dart:io';

import 'package:cat_trivia/ui/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    _initializeLocale();
  }

  Future _initializeLocale() async {
    String localeShort = Platform.localeName.substring(0, 2);
    await Jiffy.setLocale(localeShort);
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cats Trivia',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
