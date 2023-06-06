import 'package:detail_page/detail_page.dart';
import 'package:detail_page/src/blocks/details/detail_bloc.dart';
import 'package:flutter/material.dart';

/// here because so that we have a fast way run the package without the app

void main() {
  runApp(
    const MaterialApp(
      home: FakeApp(),
    ),
  );
}

class FakeApp extends StatelessWidget {
  const FakeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return createDetailPage(id: 1, type: DetailsType.movie, mockNetwork: true);
  }
}
