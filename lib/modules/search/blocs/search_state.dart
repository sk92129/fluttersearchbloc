import 'package:equatable/equatable.dart';
import 'package:searchsimple/modules/search/data/itunes_item.dart';

class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}


class SearchInitialState extends SearchState {
    final String data;
  SearchInitialState({required this.data});

  @override
  List<Object?> get props => [data];
}

class SearchSuccessState extends SearchState {
  final Iterable<ITunesItem> result;


  SearchSuccessState(this.result);

  @override
  List<Object?> get props => [result];
}


class SearchErrorState extends SearchState {
  final String msg;


  SearchErrorState(this.msg);

  @override
  List<Object?> get props => [msg];
}

