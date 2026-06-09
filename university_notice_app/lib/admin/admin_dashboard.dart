import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Admin Dashboard",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          )
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: const [

            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
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
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              const Text(
                "Welcome Admin 👋",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "Manage notices and university activities",
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 20),

              GridView.count(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.25,

                children: const [

                  DashboardCard(
                    title: "Total Notices",
                    value: "120",
                    icon: Icons.description,
                    color: Colors.blue,
                  ),

                  DashboardCard(
                    title: "Users",
                    value: "250",
                    icon: Icons.people,
                    color: Colors.green,
                  ),

                  DashboardCard(
                    title: "Pending",
                    value: "15",
                    icon: Icons.pending_actions,
                    color: Colors.orange,
                  ),

                  DashboardCard(
                    title: "Published",
                    value: "105",
                    icon: Icons.check_circle,
                    color: Colors.purple,
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const Text(
                "Quick Actions",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              GridView.count(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,

                children: [

                  actionCard(
                    context,
                    "Create Notice",
                    Icons.add_circle,
                    Colors.blue,
                  ),

                  actionCard(
                    context,
                    "Categories",
                    Icons.category,
                    Colors.orange,
                  ),

                  actionCard(
                    context,
                    "Departments",
                    Icons.school,
                    Colors.green,
                  ),

                  actionCard(
                    context,
                    "Users",
                    Icons.people,
                    Colors.purple,
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const Text(
                "Recent Notices",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              recentNotice(
                "Semester Exam Schedule Released",
                "Academic",
              ),

              recentNotice(
                "Campus Placement Drive",
                "Placement",
              ),

              recentNotice(
                "Scholarship Application Open",
                "Scholarship",
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget actionCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),

      child: InkWell(
        borderRadius: BorderRadius.circular(18),

        onTap: () {},

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            Icon(
              icon,
              color: color,
              size: 40,
            ),

            const SizedBox(height: 10),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget recentNotice(
    String title,
    String category,
  ) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.description),
        ),
        title: Text(title),
        subtitle: Text(category),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {

  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const DashboardCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,

      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18),
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            Icon(
              icon,
              color: color,
              size: 35,
            ),

            const SizedBox(height: 10),

            Text(
              value,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}