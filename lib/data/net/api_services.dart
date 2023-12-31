import 'dart:convert';
import 'package:http/http.dart' as http;
import '../app_exception.dart';
import '../net/base.dart';
import '../API/token.dart' as globals;

class ApiServices extends BaseApi {
  @override
  Future get(String url) async {
    dynamic jsonResponse;

    Map<String, String> _header = <String, String>{
      "Accept": "application/json",
      "Authorization": "Bearer ${globals.token}"
    };

    try {
      http.Response response = await http
          .get(Uri.parse(url), headers: _header)
          .timeout(const Duration(seconds: 5));

      jsonResponse = return_response(response);
    } on Exception {
      throw Exception('Failed');
    }

    return jsonResponse;
  }

  @override
  Future post(String url, data) async {
    dynamic jsonResponse;

    Map<String, String> _header = <String, String>{
      "Accept": "application/json",
      "Authorization": "Bearer ${globals.token}"
    };

    try {
      http.Response response = await http
          .post(Uri.parse(url), headers: _header, body: data)
          .timeout(const Duration(seconds: 5));

      jsonResponse = return_response(response);
    } on Exception {
      throw Exception('Failed');
    }

    return jsonResponse;
  }

  @override
  Future delete(String url) async {
    dynamic jsonResponse;

    Map<String, String> _header = <String, String>{
      "Accept": "application/json",
      "Authorization": "Bearer ${globals.token}"
    };

    try {
      http.Response response = await http
          .delete(Uri.parse(url), headers: _header)
          .timeout(const Duration(seconds: 5));

      jsonResponse = return_response(response);
    } on Exception {
      throw Exception('Failed');
    }

    return jsonResponse;
  }

  dynamic return_response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException(
            message:
                "Error occured while communicating with server with status code ${response.statusCode}");
    }
  }
}
