import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchsimple/modules/search/blocs/search_event.dart';
import 'package:searchsimple/modules/search/blocs/search_state.dart';
import 'package:searchsimple/modules/search/data/itunes_item.dart';
import 'package:searchsimple/modules/search/util/search_itune.dart';


class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(EmptySearchState()) {
    on<SearchingEvent>(
      (event, emit) async {
        Iterable<ITunesItem> data = [];

        data = await searchITunes("Major Tom");
        List<String> titles = data.map((e) => e.trackName).toList();

        emit(state.copyWith(data: titles));
      },
    );
  }
}
