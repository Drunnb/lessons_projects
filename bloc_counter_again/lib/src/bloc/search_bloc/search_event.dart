class SearchEvent {}

class SearchUserEvent extends SearchEvent {
  final String query;

  SearchUserEvent(this.query);
}
