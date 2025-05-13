import 'dart:convert';

import 'package:mr_pritam_client_app/models/base_response.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static T parseResponse<T>(
    http.Response response,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    final jsonBody = json.decode(response.body);
    final base = BaseResponse<T>.fromJson(jsonBody, fromJsonT);

    if (response.statusCode == 200 && base.data != null) {
      return base.data!;
    } else {
      throw Exception("API Error: ${base.message}");
    }
  }
}
