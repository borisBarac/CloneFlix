// ignore_for_file: public_member_api_docs

part of 'data_bloc.dart';

@immutable
abstract class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

class DataStateLoading extends DataState {}

class DataStateEmpty extends DataState {
  const DataStateEmpty(this.message, {this.enableReload = true});

  final String message;
  final bool enableReload;

  @override
  List<Object> get props => [message, enableReload];
}

class DataStateFull extends DataState {
  const DataStateFull({
    required this.data,
  });

  final List<ListItemUIModel> data;

  @override
  List<Object> get props => [data];
}
