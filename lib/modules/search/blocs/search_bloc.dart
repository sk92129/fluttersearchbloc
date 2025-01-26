import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchsimple/modules/search/blocs/search_event.dart';
import 'package:searchsimple/modules/search/blocs/search_state.dart';


class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(EmptySearchState()) {
    on<SearchingEvent>(
      (event, emit) {
        emit(state.copyWith(data: event.data));
      },
    );
  }
}
