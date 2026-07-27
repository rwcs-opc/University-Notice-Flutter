import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/notice_model.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import '../models/dashboard_model.dart';
import '../models/user_model.dart';

class ApiService {
  static const String baseUrl = "http://10.62.216.106:8000/api";

  // LOGIN
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
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
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
      }),
    );

    return jsonDecode(response.body);
  }

  // Future<List<NoticeModel>> getNotices() async {
  //   final response = await http.get(Uri.parse("$baseUrl/notices"));

  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);

  //     List notices = data["notices"];

  //     return notices.map((notice) => NoticeModel.fromJson(notice)).toList();
  //   } else {
  //     throw Exception("Failed to load notices");
  //   }
  // }
Future<List<NoticeModel>> getNotices() async {
  final response = await http.get(Uri.parse("$baseUrl/notices"));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    print("========== API RESPONSE ==========");
    print(data);

    List notices = data["notices"];

    return notices
        .map((notice) => NoticeModel.fromJson(notice))
        .toList();
  } else {
    throw Exception("Failed to load notices");
  }
}


  Future<List<NoticeModel>> getCategoryNotices(String category) async {
  final response = await http.get(
    Uri.parse("$baseUrl/notices"),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    List notices = data["notices"];

    notices = notices.where((notice) {
      return notice["category"]["category_name"]
              .toString()
              .toLowerCase() ==
          category.toLowerCase();
    }).toList();

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
  File? pdfFile,
  File? imageFile,
}) async {

  var request = http.MultipartRequest(
    "POST",
    Uri.parse("$baseUrl/notices"),
  );

  request.fields["title"] = title;
  request.fields["description"] = description;
  request.fields["department_id"] = departmentId.toString();
  request.fields["category_id"] = categoryId.toString();
  request.fields["priority"] = priority;
  request.fields["publish_date"] = publishDate;
  request.fields["created_by"] = "1";

  if (expiryDate != null) {
    request.fields["expiry_date"] = expiryDate;
  }

  // if (pdfFile != null) {
  //   request.files.add(
  //     await http.MultipartFile.fromPath(
  //       "pdf",
  //       pdfFile.path,
  //       contentType: MediaType("application", "pdf"),
  //     ),
  //   );
  // }

if (pdfFile != null) {
  print("Uploading PDF: ${pdfFile.path}");

  request.files.add(
    await http.MultipartFile.fromPath(
      "pdf",
      pdfFile.path,
      contentType: MediaType("application", "pdf"),
    ),
  );
} 

if (imageFile != null) {
  request.files.add(
    await http.MultipartFile.fromPath(
      "image",
      imageFile.path,
    ),
  );
}

else {
  print("No PDF Selected");
}
print(request.fields);
print(request.files.length);

  var response = await request.send();

  var responseBody = await response.stream.bytesToString();

  return jsonDecode(responseBody);
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
      headers: {"Content-Type": "application/json"},
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

  Future<Map<String, dynamic>> deleteNotice(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/notices/$id"));

    return jsonDecode(response.body);
  }
  Future<DashboardModel> getDashboardStats() async {
  final response = await http.get(
    Uri.parse("$baseUrl/dashboard/stats"),
  );

  if (response.statusCode == 200) {
    return DashboardModel.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception("Failed to load dashboard");
  }
}
Future<List<UserModel>> getUsers() async {
  final response = await http.get(
    Uri.parse("$baseUrl/users"),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    List users = data["users"];

    return users
        .map((user) => UserModel.fromJson(user))
        .toList();
  } else {
    throw Exception("Failed to load users");
  }
}
Future<List<UserModel>> getAdmins() async {
  final response = await http.get(
    Uri.parse("$baseUrl/admins"),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    List admins = data["admins"];

    return admins
        .map((admin) => UserModel.fromJson(admin))
        .toList();
  } else {
    throw Exception("Failed to load admins");
  }
}
Future<void> makeAdmin(int id) async {
  final response = await http.put(
    Uri.parse("$baseUrl/users/$id/make-admin"),
  );

  if (response.statusCode != 200) {
    throw Exception("Failed to make admin");
  }
 }
Future<void> removeAdmin(int id) async {
  final response = await http.put(
    Uri.parse("$baseUrl/users/$id/remove-admin"),
  );

  if (response.statusCode != 200) {
    throw Exception("Failed to remove admin");
  }
}
Future<Map<String, dynamic>> updateAdmin(
  int id,
  String name,
  String email,
) async {
  final response = await http.put(
    Uri.parse("$baseUrl/admins/$id"),
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      "name": name,
      "email": email,
    }),
  );

  return jsonDecode(response.body);
}
}
