class SearchState {
  final List<String> data;
  SearchState({required this.data});

  SearchState copyWith({
    List<String>? data,
  }) {
    return SearchState(data: data ?? this.data);
  }
}
//initial state with empty list
class EmptySearchState extends SearchState {
  EmptySearchState() : super(data: []);
}
