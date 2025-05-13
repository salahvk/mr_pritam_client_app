import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mr_pritam_client_app/api_helper.dart';
import 'package:mr_pritam_client_app/models/banner_model.dart';
import 'package:mr_pritam_client_app/models/login_response.dart';
import 'package:mr_pritam_client_app/models/privacy_model.dart';
import 'package:mr_pritam_client_app/models/terms_model.dart';

class ApiService {
  static const String baseUrl = "https://pritam-backend.vercel.app";

  static const String _token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3Zjc5MWVkODQzOTcyMDUwOTkxNDg3MCIsImlhdCI6MTc0NDI5MjA4MSwiZXhwIjoxNzc1ODI4MDgxfQ.Ag7MvMfvN3xnVcnz7KWwSDL2U_ANoljrcBQeHmpvTbI';

  static Map<String, String> headers({String? token}) => {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      };

  // Example: getAllBanner
  static Future<List<BannerModel>> getAllBanners() async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/v1/client/getAllBanner'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List data = jsonData['data'];

      return data
          .where((e) => e['bannerImage'] != null)
          .map<BannerModel>((json) => BannerModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load banners');
    }
  }

  // Example: getDashboard (auth required)
  static Future<Map<String, dynamic>> getDashboard(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/v1/home/getDashboard'),
      headers: headers(token: token),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load dashboard");
    }
  }

  // Example: giveRatingOnBooking (POST)
  static Future<bool> giveRatingOnBooking(
      Map<String, dynamic> data, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/user/giveRatingOnBooking'),
      headers: headers(token: token),
      body: jsonEncode(data),
    );

    return response.statusCode == 200;
  }

  /// Fetch user details
  static Future<Map<String, dynamic>?> getMyDetails() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/v1/user/getMyDetails'),
        headers: {
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['status'] == 200) {
          return json['data'];
        } else {
          throw Exception('API returned error: ${json['message']}');
        }
      } else {
        throw Exception('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching user details: $e');
      return null;
    }
  }

  static Future<StaffLoginResponse> staffLogin(String email) async {
    final url = Uri.parse('$baseUrl/api/v1/staff/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    return ApiHelper.parseResponse<StaffLoginResponse>(
      response,
      (json) => StaffLoginResponse.fromJson(json),
    );
  }


    static Future<PrivacyData> getPrivacy() async {
    final url = Uri.parse('$baseUrl/api/v1/user/getPrivacy');

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    return ApiHelper.parseResponse<PrivacyData>(
      response,
      (json) => PrivacyData.fromJson(json),
    );
  }


     static Future<TermsData> getTerms() async {
    final url = Uri.parse('$baseUrl/api/v1/user/getTerms');

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    return ApiHelper.parseResponse<TermsData>(
      response,
      (json) => TermsData.fromJson(json),
    );
  }
}
