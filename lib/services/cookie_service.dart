import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CookieService {
  static final CookieService _instance = CookieService._internal();
  factory CookieService() => _instance;

  CookieService._internal();

  Map<String, String> cookies = {};

  Future<void> storeCookies(http.Response response) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? rawCookies = response.headers['set-cookie'];
    if (rawCookies != null) {
      List<String> cookieParts = rawCookies.split(';');
      for (var part in cookieParts) {
        if (part.isNotEmpty) {
          List<String> cookie = part.split('=');
          if (cookie.length == 2) {
            cookies[cookie[0].trim()] = cookie[1].trim();
            log("Armazenando cookie: $cookies");
            await prefs.setString('cookie', json.encode(cookies));
          }
        }
      }
    }
  }

  Future<String> generateCookieHeader() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedCookies = prefs.getString('cookie') ?? '';
    log("Cookies armazenados: $storedCookies");

    if (storedCookies.isNotEmpty) {
      cookies = Map<String, String>.from(json.decode(storedCookies));
      String cookieHeader = cookies.entries
          .map((entry) => '${entry.key}=${entry.value}')
          .join('; ');
      log("Cabeçalho do cookie: $cookieHeader");
      return cookieHeader;
    }
    return '';
  }
}
