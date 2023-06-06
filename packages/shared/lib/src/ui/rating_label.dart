import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

/// Rating bar for showing the ratings
///
/// This one has a bit of a problem with Monarch
/// and it requires a hot reload on every change
class RatingLabel extends StatelessWidget {
  /// Constructor
  const RatingLabel(
    this._rating, {
    super.key,
    this.itemPadding = EdgeInsets.zero,
    this.itemSize = 40.0,
  });

  final double? _rating;
  final EdgeInsets itemPadding;
  final double itemSize;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: itemSize,
      initialRating: _rating ?? 0.0,
      allowHalfRating: true,
      minRating: 1,
      maxRating: 5,
      ignoreGestures: true,
      itemPadding: itemPadding,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
      ),
      onRatingUpdate: (rating) {
        // setState(() {});
      },
    );
  }
}
