import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {
  static T parseResponse<T>(
    http.Response response,
    T Function(dynamic json) fromJson, {
    dynamic Function(Map<String, dynamic> json)? extractList,
  }) {
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonBody = jsonDecode(response.body);
      final dynamic data = extractList != null ? extractList(jsonBody) : jsonBody['data'];
      return fromJson(data);
    } else {
      throw Exception('Failed: ${response.statusCode}');
    }
  }
}

