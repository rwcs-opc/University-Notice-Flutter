import 'package:flutter/material.dart';
import 'create_notice.dart';

import 'category_management.dart';
import 'department_management.dart';
import 'admin_details_screen.dart';
import 'user_management.dart';

import '../../models/dashboard_model.dart';
import '../../services/api_service.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();

  static Widget actionCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),

      onTap: onTap,

      child: Card(
        elevation: 4,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Icon(icon, color: color, size: 35),

              const SizedBox(height: 10),

              Text(
                title,
                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget recentNotice(String title, String category) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.description)),
        title: Text(title),
        subtitle: Text(category),
      ),
    );
  }
}

class _AdminDashboardState extends State<AdminDashboard> {
  final ApiService apiService = ApiService();

DashboardModel? dashboard;

bool isLoading = true;


Future<void> loadDashboard() async {
  try {
    dashboard = await apiService.getDashboardStats();

    setState(() {
      isLoading = false;
    });

    print("Dashboard Loaded");
    print("Total Notices: ${dashboard!.totalNotices}");
    print("Total Users: ${dashboard!.totalUsers}");
  } catch (e) {
    print(e);

    setState(() {
      isLoading = false;
    });
  }
}
@override
void initState() {
  super.initState();
  loadDashboard();
}

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
  return const Scaffold(
    body: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Admin Dashboard",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.admin_panel_settings,
                      color: Colors.blue,
                      size: 35,
                    ),
                  ),

                  SizedBox(height: 12),

                  Text(
                    "Admin Panel",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                "Welcome Admin 👋",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 6),

              Text(
                "Manage notices and university activities",
                style: TextStyle(color: Colors.grey.shade600),
              ),

              const SizedBox(height: 20),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.95,

                children: [
                  DashboardCard(
                    title: "Total Notices",
                    value: dashboard!.totalNotices.toString(),
                    icon: Icons.description,
                    color: Colors.blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const AdminDetailsScreen(title: "Total Notices"),
                        ),
                      );
                    },
                  ),

                  DashboardCard(
                    title: "Users",
                    value: dashboard!.totalUsers.toString(),
                    icon: Icons.people,
                    color: Colors.green,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const AdminDetailsScreen(title: "Users"),
                        ),
                      );
                    },
                  ),

                  DashboardCard(
                    title: "Pending",
                    value: "0",
                    icon: Icons.pending_actions,
                    color: Colors.orange,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AdminDetailsScreen(
                            title: "Pending Notices",
                          ),
                        ),
                      );
                    },
                  ),

                  DashboardCard(
                    title: "Published",
                    value: dashboard!.totalNotices.toString(),
                    icon: Icons.check_circle,
                    color: Colors.purple,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AdminDetailsScreen(
                            title: "Published Notices",
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const Text(
                "Quick Actions",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,

                children: [
                  AdminDashboard.actionCard(
                    context,
                    "Create Notice",
                    Icons.add_circle,
                    Colors.blue,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateNoticeScreen(),
                        ),
                      );
                    },
                  ),
                  AdminDashboard.actionCard(
                    context,
                    "Categories",
                    Icons.category,
                    Colors.orange,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const CategoryManagementScreen(),
                        ),
                      );
                    },
                  ),

                  AdminDashboard.actionCard(
                    context,
                    "Departments",
                    Icons.school,
                    Colors.green,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const DepartmentManagementScreen(),
                        ),
                      );
                    },
                  ),

                  AdminDashboard.actionCard(context, "Users", Icons.people, Colors.purple, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserManagementScreen(),
                      ),
                    );
                  }),
                ],
              ),

              const SizedBox(height: 25),

              const Text(
                "Recent Notices",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              AdminDashboard.recentNotice("Semester Exam Schedule Released", "Academic"),

              AdminDashboard.recentNotice("Campus Placement Drive", "Placement"),

              AdminDashboard.recentNotice("Scholarship Application Open", "Scholarship"),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const DashboardCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),

      child: Card(
        elevation: 4,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),

        child: Padding(
          padding: const EdgeInsets.all(12),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Icon(icon, color: color, size: 35),

              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
