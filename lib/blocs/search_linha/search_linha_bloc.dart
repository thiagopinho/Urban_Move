import 'dart:async';

import 'package:urban_move/blocs/search_linha/search_linha_events.dart';
import 'package:urban_move/blocs/search_linha/search_linha_state.dart';
import 'package:urban_move/models/linha_model.dart';
import 'package:urban_move/repositories/search_linha_repository.dart';

class SearchLinhaBloc {
  final SearchLinhaRepository _repository;
  SearchLinhaBloc(
    this._repository,
  ) {
    _inputSearchController.stream.listen(_mapEventToState);
  }

  final StreamController<BuscaEvent> _inputSearchController =
      StreamController<BuscaEvent>();

  final StreamController<BuscaState> _outputSearchController =
      StreamController<BuscaState>();

  Sink<BuscaEvent> get inputBusca => _inputSearchController.sink;
  Stream<BuscaState> get outputBusca => _outputSearchController.stream;

  void _mapEventToState(BuscaEvent event) async {
    List<Linha> linhas = [];

    _outputSearchController.add(SearchLinhaLoadingState());

    if (event is LoadBusca) {
      linhas = await _repository.fetch(event.query);
    } else if (event is AddBuscaEvent) {
      // TODO
    } else if (event is RemoveBuscaEvent) {
      // TODO
    }

    _outputSearchController.add(SearchLinhaLoadedState(listLoaded: linhas));
  }
}
