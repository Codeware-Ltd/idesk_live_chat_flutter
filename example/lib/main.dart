import 'package:flutter/material.dart';
import 'package:idesk_live_chat/idesk_chat_config.dart';
import 'package:idesk_live_chat/idesk_live_chat.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE83A38)),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFE83A38),
          title: const Text('IDesk Flutter Chat SDK',
              style: TextStyle(color: Colors.white)),
        ),
        body: IDeskLiveChat(
          config: IDeskLiveChatConfig(
            resourceUri: "xxxx.idesk360.com", //required
            appUri: "xxx.idesk360.com", //required
            pageId: "xxxxxxx", //required
            miscellaneous: {"float": 0}, //optional,
            customerInfo: {"name": "xxx", "rmn": "xxx"}, //optional,
          ),
        ),
      ),
    );
  }
}
