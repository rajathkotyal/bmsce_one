import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/platform_interface.dart';

class Results extends StatefulWidget {

  WebViewFacUI createState() => WebViewFacUI();

}

var urls = [
  'https://bmsce.ac.in/home/AllNews',
  'meet.google.com'
      'drive.google.com',
  'https://bmsce.ac.in/home/Computer-Science-and-Engineering-Faculty',
];

class WebViewFacUI extends State<Results>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
        ),
        body: WebView(
          initialUrl: 'https://bmsce.ac.in/home/Results',
          javascriptMode: JavascriptMode.unrestricted,

        )
    );
  }
}