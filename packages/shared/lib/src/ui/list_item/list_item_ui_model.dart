// ignore_for_file: public_member_api_docs

part of './list_item.dart';

/// Needs a better name
/// <br> Used as a cell in page routes
/// <br> Click on this would normally be taking us to detail page
@immutable
class ListItemUIModel extends Equatable {
  const ListItemUIModel({
    required this.posterUrl,
    required this.title,
    required this.id,
    required this.click,
  });
  final NavigateToBlock? click;
  final String posterUrl;
  final String title;
  final int id;

  @override
  List<Object?> get props => [id, posterUrl, title];

  String get posteLoadableUrl {
    return ImageRoute(posterUrl, ImageRouteType.poster, ImageRouteQuality.M)
            .getUrl()
            ?.toString() ??
        '';
  }

  ListItemUIModel copyWith({
    NavigateToBlock? click,
    String? posterUrl,
    String? title,
    int? id,
  }) =>
      ListItemUIModel(
        posterUrl: posterUrl ?? this.posterUrl,
        title: title ?? this.title,
        id: id ?? this.id,
        click: click ?? this.click,
      );

  ListItemUIModel copyWithClick(NavigateToBlock click) =>
      copyWith(click: click);
}
