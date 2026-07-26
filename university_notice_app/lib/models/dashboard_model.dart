import '../../models/dashboard_model.dart';
import '../../services/api_service.dart';

class DashboardModel {
  final int totalNotices;
  final int totalUsers;
  final int totalDepartments;
  final int totalCategories;
  final List<dynamic> recentNotices;

  DashboardModel({
    required this.totalNotices,
    required this.totalUsers,
    required this.totalDepartments,
    required this.totalCategories,
    required this.recentNotices,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      totalNotices: json["total_notices"],
      totalUsers: json["total_users"],
      totalDepartments: json["total_departments"],
      totalCategories: json["total_categories"],
      recentNotices: json["recent_notices"],
    );
  }
}