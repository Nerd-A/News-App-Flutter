import 'dart:async';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class articles extends StatefulWidget {
  final String Blogurl;

  const articles({required this.Blogurl});

  @override
  State<articles> createState() => _articlesState();
}

class _articlesState extends State<articles> {
  final Completer<WebViewController> completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Today's",
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              " NEWS",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
          )
        ],
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.Blogurl,
          onWebViewCreated: ((WebViewController webViewController) {
            completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
