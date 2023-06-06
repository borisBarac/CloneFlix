library list_item;

import 'package:api_core/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:shared/src/test_cache_image_manager.dart';

part './list_item_ui_model.dart';

/// Default list item used to show movie/tv show items in rows
class ListItem extends StatelessWidget {
  /// used mostly for mocks
  const ListItem({
    super.key,
    required this.imagePath,
    this.id = 0,
  }) : _click = null;

  /// Create widget from model
  ListItem.withModel(ListItemUIModel model, {super.key})
      : imagePath = model.posteLoadableUrl,
        _click = model.click,
        id = model.id;

  ///
  final String imagePath;

  ///
  final NavigateToBlock? _click;

  ///
  final int id;

  double get _borderRadius => 15;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: GestureDetector(
        onTap: () {
          // dart can't do _click?() with blocks :(
          // ignore: prefer_null_aware_method_calls
          if (_click != null) _click!(id);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_borderRadius), // Image border
            child: CachedNetworkImage(
              cacheManager: getCacheManager(),
              imageUrl: imagePath,
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return const LoadingIndicator(0.25);
              },
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
