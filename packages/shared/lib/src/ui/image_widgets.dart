import 'package:api_core/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:shared/src/test_cache_image_manager.dart';

/// Shared image used to backdrops
class BackdropImage extends StatelessWidget {
  /// nodoc
  const BackdropImage(this.url, {super.key});

  double get _borderRadius => 0;

  /// image url
  final String url;

  String get _loadableUrl =>
      ImageRoute(url, ImageRouteType.backdrop, ImageRouteQuality.L)
          .getUrl()
          .toString();

  @override
  Widget build(BuildContext context) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_borderRadius), // Image border
          child: CachedNetworkImage(
            cacheManager: getCacheManager(),
            imageUrl: _loadableUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return const LoadingIndicator(0.25);
            },
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.fill,
          ),
        ),
      );
}
