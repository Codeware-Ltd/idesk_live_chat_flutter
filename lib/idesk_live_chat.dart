library idesk_live_chat;

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart' as http;

import 'idesk_chat_config.dart';

class IDeskLiveChat extends StatefulWidget {
  const IDeskLiveChat({super.key, required this.config});
  final IDeskLiveChatConfig config;

  @override
  State<IDeskLiveChat> createState() => _IDeskLiveChatState();
}

class _IDeskLiveChatState extends State<IDeskLiveChat> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialData: InAppWebViewInitialData(data: '''
          <!DOCTYPE html>
<html>
<head>
</head>
<body style="background-color: #f5f5f5;">
  <div style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
    <div class="loader" style="width: 100px; height: 100px; border: 10px solid #f2d6d5; border-radius: 50%; border-top: 10px solid #E83A38; animation: spin 1s linear infinite; margin: 0 auto;">
    </div>
    <p style="color: #333; font-size: 48px; margin-top: 40px; font-weight: bold">Please Wait</p>
  </div>
  <style>
    @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }
  </style>
</body>
</html>

          '''),
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          javaScriptEnabled: true,
          supportZoom: false,
        ),
        android: AndroidInAppWebViewOptions(
          useHybridComposition: true,
        ),
      ),
      onWebViewCreated: (InAppWebViewController controller) {
        _webViewController = controller;
        _getData();
      },
      onConsoleMessage: (controller, consoleMessage) {
        log(consoleMessage.toString());
      },
    );
  }

  _getData() async {
    String html = "";
    try {
      var result = await http.post(
        Uri.parse("https://app.idesk360.com/init-iDesk-live-chat"),
        body: json.encode(widget.config.toMap()),
        headers: {"Content-Type": "application/json"},
      );
      html = result.body;
    } on SocketException {
      html = '''
          <!DOCTYPE html>
<html>
<head>
</head>
<body style="background-color: #f5f5f5; ">
  <div style="position: absolute; top: 50%;  transform: translate(50%, -50%); text-align: center;">
      <p style="font-size: 48px; font-weight: bold;">No Internet Connection</p>
  </div>
</body>
</html>

          ''';
    } on TimeoutException {
      html = '''
          <!DOCTYPE html>
<html>
<head>
</head>
<body style="background-color: #f5f5f5; ">
  <div style="position: absolute; top: 50%;  transform: translate(50%, -50%); text-align: center;">
      <p style="font-size: 48px; font-weight: bold;">Connection Timeout</p>
  </div>
</body>
</html>

          ''';
    } catch (e) {
      html = '''
          <!DOCTYPE html>
<html>
<head>
</head>
<body style="background-color: #f5f5f5; ">
  <div style="position: absolute; top: 50%;  transform: translate(50%, -50%); text-align: center;">
      <p style="font-size: 48px; font-weight: bold;">Something Went Wrong</p>
  </div>
</body>
</html>

          ''';
    }
    _webViewController.loadData(
        data: html,
        mimeType: 'text/html',
        encoding: 'utf8',
        baseUrl: Uri.parse('https://www.idesk360.com/'));
  }
}
