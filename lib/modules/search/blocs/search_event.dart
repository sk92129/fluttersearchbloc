abstract class SearchEvent {
  SearchEvent();
}

class SearchingEvent extends SearchEvent {
  final String query;
  SearchingEvent( this.query);
}
