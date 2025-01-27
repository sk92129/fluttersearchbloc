import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchsimple/modules/search/blocs/search_event.dart';
import 'package:searchsimple/modules/search/blocs/search_state.dart';
import 'package:searchsimple/modules/search/data/itunes_item.dart';
import 'package:searchsimple/modules/search/util/search_itunes.dart';


class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitialState(data: '')) {
    on<SearchingEvent>(_onSearchEvent);
  }



  Future<void> _onSearchEvent(SearchingEvent event,
      Emitter<SearchState> emit) async {
   print('Searching for: ' + event.query);
   try {
      final Iterable<ITunesItem> results = await searchITunes(event.query); 
      
      emit(SearchSuccessState(results));


    } on Exception catch (e,s) {
      emit(SearchErrorState('Error searching iTunes: $e'));
    }
  
      
  } 
}
