import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchsimple/modules/search/blocs/search_event.dart';
import 'package:searchsimple/modules/search/blocs/search_state.dart';


class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(EmptySearchState()) {
    on<SearchingEvent>(_onSearchEvent);
  }
/*
    on<SearchingEvent>(
      (event, emit) {
        emit(state.copyWith(data: event.data));
      },
    );
    */


  Future<void> _onSearchEvent(SearchingEvent event,
      Emitter<SearchState> emit) async {

    emit(state.copyWith(data: event.data));
  }
  
      
}
