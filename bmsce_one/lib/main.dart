import 'package:bmsce_one/profile.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'profile.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Bottom Navigation Bar example project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainApp(),
      initialRoute: '/',
    );
  }
}
