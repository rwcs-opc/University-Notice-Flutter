import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/notice_model.dart';

class ApiService {
  static const String baseUrl = "http://10.62.216.106:8000/api";

  // LOGIN
  Future<Map<String, dynamic>> login(
      String email,
      String password,
      ) async {


    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    return jsonDecode(response.body);
  }
  Future<Map<String, dynamic>> register(
  String name,
  String email,
  String password,
  String confirmPassword,
) async {

  final response = await http.post(
    Uri.parse("$baseUrl/register"),
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": confirmPassword,
    }),
  );

  return jsonDecode(response.body);
}
Future<List<NoticeModel>> getNotices() async {

  final response = await http.get(
    Uri.parse("$baseUrl/notices"),
  );

  if (response.statusCode == 200) {

    final data = jsonDecode(response.body);

    List notices = data["notices"];

    return notices
        .map((notice) => NoticeModel.fromJson(notice))
        .toList();

  } else {

    throw Exception("Failed to load notices");

  }

}
}