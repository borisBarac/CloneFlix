import 'package:flutter/material.dart';
import 'package:home_page/src/home_core/home_page.dart';

/// here because so that we have a fast way run the package without the app

void main() {
  runApp(const FakeApp());
}

class FakeApp extends StatelessWidget {
  const FakeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
