import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:theme_task/src/string.dart';

class ApiNetwork {
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = _response(response);
    } on SocketException {
      throw (Strings.noInternet);
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    if (response.body.isEmpty) {
      throw Exception(Strings.noData);
    }
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body;
        return responseJson;
      case 400:
        throw (response.body);

      case 403:
        throw (response.body);
      case 500:

      default:
        throw (Strings.dataException + (response.statusCode).toString());
    }
  }
}
