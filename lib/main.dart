import 'package:flutter/material.dart';

import 'package:flutter_netflix_responsive_ui/app/locator.dart';
import 'package:flutter_netflix_responsive_ui/ui/views/views.dart';

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Netflix UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: NavigationView(),
    );
  }
}
