import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/platform_interface.dart';

class WebViewLoad extends StatefulWidget {

  WebViewLoadUI createState() => WebViewLoadUI();

}

var urls = [
  'https://bmsce.ac.in/home/AllNews',
  'meet.google.com'
  'drive.google.com',
  'https://bmsce.ac.in/home/Computer-Science-and-Engineering-Faculty',
];

class WebViewLoadUI extends State<WebViewLoad>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: WebView(
          initialUrl: 'https://drive.google.com/drive/u/0/folders/0ByKx631nSG_hfmVEemlGZXBuWHZ2X2ZrZTA0OTROOFdOMDEzek8zUVpGaHlrdGJrSi1sYWM',
          javascriptMode: JavascriptMode.unrestricted,

        )
    );
  }
}