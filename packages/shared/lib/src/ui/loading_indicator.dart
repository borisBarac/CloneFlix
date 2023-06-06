import 'package:flutter/material.dart';

/// Loading indicator
/// Supports all platforms
class LoadingIndicator extends StatelessWidget {
  ///
  const LoadingIndicator(
    this.sizeFactor, {
    super.key,
  });

  ///
  final double sizeFactor;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: sizeFactor,
      child: const Align(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
