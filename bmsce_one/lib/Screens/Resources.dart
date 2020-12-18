import 'package:bmsce_portal/hp/home_screen_main.dart';
import 'package:flutter/material.dart';
import 'search.dart';

class Resources extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreenMain()),
            ),
          ),
        ),
        body: Center(child: Text('Resources Page')));
  }
}
