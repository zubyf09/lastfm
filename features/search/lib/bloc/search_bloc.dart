import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:meta/meta.dart';
import 'package:network/repositories/search_repository_imp.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchRepositoryImp repository = SearchRepositoryImp();

  SearchBloc() : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchEvent) {
      yield* _mapEventSearchToState(event);
    }
  }

  Stream<SearchState> _mapEventSearchToState(
      SearchEvent event) async* {
    yield SearchLoding();
    try {
      final results = await repository.getSearchList(event.search);
      if (results == null) {
        yield SearchError(message: 'Some Thing Went Wrong', httpStatus: 0);
      } else if (results.results != null) {
        yield SearchLoaded(searchResponse: results);
      } else {
        yield SearchError(message: "Data Not found", httpStatus: 0);
      }
    } catch (e) {
      yield SearchError(
          message: Constants.CONNECTION_ERROR_MESSAGE, httpStatus: 0);
    }
  }
}
