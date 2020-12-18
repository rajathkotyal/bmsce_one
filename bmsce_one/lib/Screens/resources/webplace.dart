import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/platform_interface.dart';

class WebPlace extends StatefulWidget {

  WebPlaceUI createState() => WebPlaceUI();

}

var urls = [
  'https://bmsce.ac.in/home/AllNews',
  'meet.google.com'
      'drive.google.com',
  'https://bmsce.ac.in/home/Computer-Science-and-Engineering-Faculty',
];

class WebPlaceUI extends State<WebPlace>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: WebView(
          initialUrl: 'https://drive.google.com/drive/folders/1bcuEsAnA6J7c6ktCwb9E6ZIEHZsfXJRr',
          javascriptMode: JavascriptMode.unrestricted,

        )
    );
  }
}