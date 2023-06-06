// ignore_for_file: public_member_api_docs

part of 'data_bloc.dart';

enum LoadType { tv, movie }

@immutable
abstract class DataEvent extends Equatable {
  const DataEvent();

  @override
  List<Object> get props => [];
}

class LoadAll extends DataEvent {
  const LoadAll({this.isPullToRefresh = false, this.type = LoadType.movie});
  final bool isPullToRefresh;
  final LoadType type;
}

class AddData extends DataEvent {
  const AddData({required this.page});

  final int page;

  @override
  List<Object> get props => [];
}
