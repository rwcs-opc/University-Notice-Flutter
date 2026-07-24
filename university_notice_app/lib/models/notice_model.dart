// class NoticeModel {
//   final int id;
//   final String title;
//   final String description;
//   final String category;
//   final String department;
//   final String date;
//   final int views;
//   final bool urgent;
//   final String priority;

//   NoticeModel({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.category,
//     required this.department,
//     required this.date,
//     required this.views,
//     required this.urgent,
//     required this.priority,
//   });

//   // factory NoticeModel.fromJson(Map<String, dynamic> json) {
//   //   return NoticeModel(
//   //     id: json["id"] ?? 0,
//   //     title: json["title"] ?? "",
//   //     description: json["description"] ?? "",

//   //     // Read nested objects
//   //     category: json["category"] != null
//   //         ? json["category"]["category_name"] ?? ""
//   //         : "",

//   //     department: json["department"] != null
//   //         ? json["department"]["department_name"] ?? ""
//   //         : "",

//   //     date: json["publish_date"] ?? "",

//   //     // Backend doesn't return these yet
//   //     views: json["views"] ?? 0,
//   //     urgent: json["urgent"] ?? false,

//   //     priority: json["priority"] ?? "",
//   //   );
//   // }
//   factory NoticeModel.fromJson(Map<String, dynamic> json) {
//   return NoticeModel(
//     id: json["id"],
//     title: json["title"] ?? "",
//     description: json["description"] ?? "",
//     category: json["category"]?["category_name"] ?? "",
//     department: json["department"]?["department_name"] ?? "",
//     date: json["publish_date"] ?? "",
//     views: json["views"] ?? 0,
//     urgent: json["urgent"] ?? false,
//     priority: json["priority"] ?? "",
//   );
// }
// }

class NoticeModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final String department;
  final String date;
  final int views;
  final bool urgent;
  final String priority;

  NoticeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.department,
    required this.date,
    required this.views,
    required this.urgent,
    required this.priority,
  });

  factory NoticeModel.fromJson(Map<String, dynamic> json) {
    return NoticeModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      description: json["description"] ?? "",

      // Nested objects from Laravel
      category: json["category"]?["category_name"] ?? "",
      department: json["department"]?["department_name"] ?? "",

      date: json["publish_date"] ?? "",
      priority: json["priority"] ?? "",

      // Your backend doesn't return these yet
      views: json["views"] ?? 0,
      urgent: json["priority"] == "High",
    );
  }
}