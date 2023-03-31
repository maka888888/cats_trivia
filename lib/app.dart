import 'package:cat_trivia/ui/home_page/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cats Trivia',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
