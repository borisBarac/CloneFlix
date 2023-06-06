// ignore_for_file: public_member_api_docs

part of 'detail_bloc.dart';

@immutable
abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

@immutable
class DetailStateLoading extends DetailState {}

@immutable
class DetailStateEmpty extends DetailState {
  const DetailStateEmpty({
    this.id,
    this.type,
    required this.message,
    this.enableReload = true,
  });

  final int? id;
  final DetailsType? type;
  final String message;
  final bool enableReload;

  @override
  List<Object> get props =>
      [message, enableReload, id ?? '', type ?? DetailsType.movie];
}

@immutable
class DetailStateFull extends DetailState {
  const DetailStateFull(
    this.model,
  );

  final DetailPageModel model;

  @override
  List<Object> get props => [model];
}
