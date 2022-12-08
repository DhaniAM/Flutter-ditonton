abstract class SearchEvent {
  const SearchEvent();
}

class OnQueryChanged extends SearchEvent {
  final String query;

  OnQueryChanged(this.query);
}
