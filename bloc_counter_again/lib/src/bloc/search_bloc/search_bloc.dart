import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:bloc_counter_again/src/bloc/search_bloc/search_event.dart';
import 'package:bloc_counter_again/src/bloc/search_bloc/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:dio/dio.dart';

const apiUrl = 'https://api.jikan.moe/v4/users';

EventTransformer<E> debounceDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.debounce(duration), mapper);
  };
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState()) {
    on<SearchUserEvent>(
      _onSearch,
      transformer: debounceDroppable(
        const Duration(milliseconds: 300),
      ),
    );
  }

  final _httpClient = Dio();

  _onSearch(SearchUserEvent event, Emitter<SearchState> emit) async {
    if (event.query.length < 3) return;
    final res = await _httpClient.get(
      apiUrl,
      queryParameters: {
        'q': event.query,
      },
    );
    emit(SearchState(users: res.data['data']));
  }
}
