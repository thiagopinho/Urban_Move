import 'dart:convert';
import 'dart:developer';

import 'package:urban_move/core/infra/http_client.dart';
import 'package:urban_move/models/linha_model.dart';
import 'package:urban_move/utils/constants.dart';

class SearchLinhaRepository {
  final Client _httpClient;
  SearchLinhaRepository(this._httpClient);
  Future<List<Linha>> fetch(String linha) async {
    try {
      var response = await _httpClient.get(
        Endpoints.buscarLinha,
        {"termosBusca": linha},
      );

      if (response.statusCode == 200) {
        log("Response: ${response.body}");

        List<dynamic> jsonList = jsonDecode(response.body);

        return jsonList.map((json) => Linha.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Failed to load $e');
    }
  }
}
