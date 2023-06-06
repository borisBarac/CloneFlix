// ignore_for_file: public_member_api_docs

part of 'detail_bloc.dart';

enum DetailsType {
  tv,
  movie;
}

@immutable
abstract class DetailEvent {}

@immutable
class LoadDetails extends DetailEvent {
  LoadDetails(this.id, this.type);

  final DetailsType type;
  final int id;
}
