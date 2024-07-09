import 'package:urban_move/models/linha_model.dart';
import 'package:urban_move/repositories/search_linha_repository.dart';

class SearchLinhaBloc {
  final SearchLinhaRepository _repository;
  SearchLinhaBloc(this._repository);

  Future<Linha> fetch(String linha) async {
    try {
      return await _repository.fetch(linha);
    } catch (e) {
      rethrow;
    }
  }
}
