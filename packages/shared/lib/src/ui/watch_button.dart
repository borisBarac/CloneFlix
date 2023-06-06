import 'package:flutter/material.dart';

/// Button used to play videos
class WatchButton extends StatelessWidget {
  /// Constructor
  const WatchButton(this.onTap, {super.key, this.iconSize});

  ///
  final Size? iconSize;

  ///
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final iconSizeUn = iconSize ?? const Size(66 * 2.5, 66);
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(40)),
      child: Material(
        color: Theme.of(context).primaryColor, // Button color
        child: InkWell(
          splashColor: Colors.orange, // Splash color
          onTap: onTap,
          child: SizedBox(
            width: iconSizeUn.width,
            height: iconSizeUn.height,
            child: Icon(
              Icons.play_arrow_sharp,
              size: iconSizeUn.height / 2,
            ),
          ),
        ),
      ),
    );
  }
}
