import 'dart:convert';
import 'dart:developer';

import 'package:urban_move/core/infra/http_client.dart';
import 'package:urban_move/models/position_model.dart';
import 'package:urban_move/utils/constants.dart';

class PositionRepository {
  final Client _httpClient;
  PositionRepository(this._httpClient);
  Future<List<PositionModel>> fetch(String linha) async {
    try {
      var response = await _httpClient.get(
        Endpoints.getPositionVehicles,
        {"codigoLinha": linha},
      );

      if (response.statusCode == 200) {
        log("Response: ${response.body}");

        List<dynamic> jsonList = jsonDecode(response.body)['vs'];

        return jsonList.map((json) => PositionModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Failed to load $e');
    }
  }
}
