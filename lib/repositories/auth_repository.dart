import 'package:urban_move/core/infra/http_client.dart';
import 'package:urban_move/utils/constants.dart';

class AuthRepository {
  AuthRepository(this._client);

  final Client _client;

  Future<bool> login() async {
    try {
      var response = await _client.post(Endpoints.login);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}
