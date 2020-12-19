import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/platform_interface.dart';

class WebSyllabus extends StatefulWidget {

  WebSyllabusUI createState() => WebSyllabusUI();

}

var urls = [
  'https://bmsce.ac.in/home/AllNews',
  'meet.google.com'
      'drive.google.com',
  'https://bmsce.ac.in/home/Computer-Science-and-Engineering-Faculty',
];

class WebSyllabusUI extends State<WebSyllabus>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: WebView(
          initialUrl: 'https://drive.google.com/file/d/1Ur3CN2Dvh_BFa_MStGP-MYjp4bu_G4Zg/view?usp=sharing',
          javascriptMode: JavascriptMode.unrestricted,

        )
    );
  }
}