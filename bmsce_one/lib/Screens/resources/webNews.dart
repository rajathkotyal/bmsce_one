import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/platform_interface.dart';

class WebViewNews extends StatefulWidget {

  WebViewNewsUI createState() => WebViewNewsUI();

}

var urls = [
  'https://bmsce.ac.in/home/AllNews',
  'meet.google.com'
      'drive.google.com',
  'https://bmsce.ac.in/home/Computer-Science-and-Engineering-Faculty',
];

class WebViewNewsUI extends State<WebViewNews>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
        ),
        body: WebView(
          initialUrl: 'https://bmsce.ac.in/home/AllNews',
          javascriptMode: JavascriptMode.unrestricted,

        )
    );
  }
}