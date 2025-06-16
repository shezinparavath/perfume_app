import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:perfume_app/models/home_data_model/home_data_model.dart';
import '../models/login_token_model/login_token_model.dart';

class ApiServices {
  Future<LoginTokenModel> loginToken() async {
    try {
      final response = await http.post(
        Uri.parse(
          'https://s419.previewbay.com/fragrance-b2b-backend/api/v1/anonymous-login',
        ),
        body: {'device_token': 'test_token', 'device_type': '1'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = json.decode(response.body);
        return LoginTokenModel.fromJson(body);
      } else {
        throw Exception(
          'Login failed with status code: ${response.statusCode}, body: ${response.body}',
        );
      }
    } catch (e) {
      throw Exception('Exception during login: $e');
    }
  }

  Future<HomeDataModel> getHomeData(String token) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://s419.previewbay.com/fragrance-b2b-backend/api/v1/home',
        ),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        return HomeDataModel.fromJson(body);
      } else {
        throw Exception(
          'Home data fetch failed with status code: ${response.statusCode}, body: ${response.body}',
        );
      }
    } catch (e) {
      throw Exception('Exception during home data fetch: $e');
    }
  }
}
