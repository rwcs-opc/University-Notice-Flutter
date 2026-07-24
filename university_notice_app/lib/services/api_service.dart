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
Future<Map<String, dynamic>> createNotice({
  required String title,
  required String description,
  required int departmentId,
  required int categoryId,
  required String priority,
  required String publishDate,
  String? expiryDate,
}) 
    

  async {
    
  final response = await http.post(
    Uri.parse("$baseUrl/notices"),
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      "title": title,
      "description": description,
      "department_id": departmentId,
      "category_id": categoryId,
      "priority": priority,
      "publish_date": publishDate,
      "expiry_date": expiryDate,
      "created_by": 1,
    }),
  );

  return jsonDecode(response.body);
}
Future<Map<String, dynamic>> updateNotice({
  required int id,
  required String title,
  required String description,
  required int departmentId,
  required int categoryId,
  required String priority,
  required String publishDate,
  required int createdBy,
}) async {

  final response = await http.put(
    Uri.parse("$baseUrl/notices/$id"),
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      "title": title,
      "description": description,
      "department_id": departmentId,
      "category_id": categoryId,
      "priority": priority,
      "publish_date": publishDate,
      "created_by": createdBy,
    }),
  );

  return jsonDecode(response.body);
}
}