import 'package:urban_move/models/linha_model.dart';

abstract class BuscaState {
  final List<Linha> listLinha;
  BuscaState({required this.listLinha});
}

class SearchLinhaInitialState extends BuscaState {
  SearchLinhaInitialState() : super(listLinha: []);
}

class SearchLinhaLoadingState extends BuscaState {
  SearchLinhaLoadingState() : super(listLinha: []);
}

class SearchLinhaLoadedState extends BuscaState {
  SearchLinhaLoadedState({required List<Linha> listLoaded})
      : super(listLinha: listLoaded);
}

class SearchLinhaErrorState extends BuscaState {
  final String message;
  SearchLinhaErrorState({required this.message, required super.listLinha});
}
