import 'package:bmsce_portal/Screens/resources/calendar.dart';
import 'package:bmsce_portal/Screens/resources/webFac.dart';
import 'package:bmsce_portal/Screens/resources/webplace.dart';
import 'package:bmsce_portal/Screens/resources/webview.dart';
import 'package:bmsce_portal/hp/home_screen_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'websyl.dart';


class Resources extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center
          ,

          children: [

            Text("Resources",
              style: TextStyle(
                fontFamily: 'NimbusSanL',
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),),
            SizedBox(height: 75,),

            OutlineButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>   WebViewLoad(),
                  )),
              borderSide: BorderSide(color: Colors.blue),
              splashColor: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                'NOTES',
                style: TextStyle(
                  fontFamily: 'NimbusSanL',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 20,),
            OutlineButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Calendar(),
                  )),
              borderSide: BorderSide(color: Colors.blue),
              splashColor: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                'CALENDAR OF EVENTS',
                style: TextStyle(
                  fontFamily: 'NimbusSanL',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 20),
            OutlineButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  WebPlace(),
                  )),
              borderSide: BorderSide(color: Colors.blue),
              splashColor: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                'PLACEMENT MATERIALS',
                style: TextStyle(
                  fontFamily: 'NimbusSanL',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 20),
            OutlineButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>   WebViewFac(),
                  )),
              borderSide: BorderSide(color: Colors.blue),
              splashColor: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                'FACULTY INFO',
                style: TextStyle(
                  fontFamily: 'NimbusSanL',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://www.google.com/drive';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL1() async {
  const url = 'https://bmsce.ac.in/home/Computer-Science-and-Engineering-Faculty';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

