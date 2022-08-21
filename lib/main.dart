import 'package:flutter/material.dart';
import 'package:telegram_clone_ui/view/telegram_ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: TelegramUi(),
    );
  }
}
