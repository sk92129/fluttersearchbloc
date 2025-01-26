abstract class SearchEvent {
  SearchEvent();
}

class SearchingEvent extends SearchEvent {
  final List<String> data;
  SearchingEvent(this.data);
}
