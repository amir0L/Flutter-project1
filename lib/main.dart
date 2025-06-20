import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/P2Screen.dart';

void main() {
  runApp(const LearningPartnerApp());
}

class LearningPartnerApp extends StatelessWidget {
  const LearningPartnerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning Partner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const P2Screen(),
    );
  }
}