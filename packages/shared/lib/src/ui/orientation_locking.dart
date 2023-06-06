import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// OrientationLock - defaults to portrait
/// on dispose, screen is gonna unlock
class OrientationLock extends StatefulWidget {
  ///
  const OrientationLock(this.child, {this.landscape = false, super.key});

  /// lock to landscape
  final bool landscape;
  final Widget child;

  @override
  State<StatefulWidget> createState() => _OrientationLockState();
}

class _OrientationLockState extends State<OrientationLock> {
  @override
  void initState() {
    super.initState();
    _lockTo(landscape: widget.landscape);
  }

  @override
  void dispose() {
    _unlock();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;

  void _lockTo({bool landscape = false}) {
    SystemChrome.setPreferredOrientations(
      landscape
          ? [
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeRight,
            ]
          : [DeviceOrientation.portraitUp],
    );
  }

  void _unlock() {
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }
}
