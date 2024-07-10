import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:urban_move/services/cookie_service.dart';

class Client {
  final CookieService _cookieService;
  Client(this._cookieService);

  static const String baseUrl = 'https://api.olhovivo.sptrans.com.br/v2.1';
  static String? authToken;

  Future<http.Response> get(String endpoint,
      [Map<String, dynamic>? queryParameters]) async {
    try {
      var url = Uri.parse('$baseUrl/$endpoint');

      if (queryParameters != null) {
        url = Uri.parse('$baseUrl/$endpoint')
            .replace(queryParameters: queryParameters);
      }
      await dotenv.load(fileName: ".env");
      String apiKey = dotenv.env['API_KEY'] ?? '';
      log("URL: $url ");
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'multipart/form-data',
          'Accept': 'application/json',
          'Cache-Control': 'no-cache',
          'Cookie': await _cookieService.generateCookieHeader(),
        },
      );
      log("Response GET: ${response.body} | Status Code -> ${response.statusCode}");
      return response;
    } catch (e) {
      throw Exception('Failed to get data: $e');
    }
  }

  Future<http.Response> post(
    String endpoint,
    // dynamic body,
  ) async {
    try {
      await dotenv.load(fileName: ".env");
      String apiKey = dotenv.env['API_KEY'] ?? '';
      var url = Uri.parse('$baseUrl/$endpoint?token=$apiKey');
      var response = await http.post(
        url,
        //  body: body,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      _cookieService.storeCookies(response);
      log("Response POST: ${response.body}");
      return response;
    } catch (e) {
      throw Exception('Failed to post data: $e');
    }
  }
}
