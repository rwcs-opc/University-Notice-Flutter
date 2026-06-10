import 'package:flutter/material.dart';

class SystemAnalyticsScreen extends StatelessWidget {
  const SystemAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: CustomScrollView(
        slivers: [

          // HEADER
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            backgroundColor: Colors.indigo,

            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff312E81),
                      Color(0xff4F46E5),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),

                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(height: 40),

                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.analytics,
                        size: 50,
                        color: Colors.indigo,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "System Analytics",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Monitor system performance",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  // OVERVIEW TITLE
                  const Text(
                    "Overview",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // STATS GRID
                  GridView.count(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.15,

                    children: [

                      analyticsCard(
                        "Total Users",
                        "1,250",
                        Icons.people,
                        Colors.blue,
                      ),

                      analyticsCard(
                        "Admins",
                        "18",
                        Icons.admin_panel_settings,
                        Colors.indigo,
                      ),

                      analyticsCard(
                        "Notices",
                        "120",
                        Icons.campaign,
                        Colors.orange,
                      ),

                      analyticsCard(
                        "Departments",
                        "12",
                        Icons.school,
                        Colors.green,
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // GROWTH SECTION
                  const Text(
                    "Growth Statistics",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  growthCard(
                    "User Growth",
                    "78%",
                    0.78,
                    Colors.blue,
                  ),

                  growthCard(
                    "Notice Engagement",
                    "85%",
                    0.85,
                    Colors.orange,
                  ),

                  growthCard(
                    "Department Activity",
                    "69%",
                    0.69,
                    Colors.green,
                  ),

                  const SizedBox(height: 25),

                  // SYSTEM HEALTH
                  const Text(
                    "System Health",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(20),

                      child: Column(
                        children: [

                          healthTile(
                            "Server Status",
                            "Online",
                            Colors.green,
                            Icons.check_circle,
                          ),

                          const Divider(),

                          healthTile(
                            "Database",
                            "Healthy",
                            Colors.blue,
                            Icons.storage,
                          ),

                          const Divider(),

                          healthTile(
                            "Backup Status",
                            "Updated",
                            Colors.orange,
                            Icons.backup,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // RECENT ACTIVITIES
                  const Text(
                    "Recent Activities",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  activityCard(
                    Icons.add_circle,
                    Colors.green,
                    "New Notice Published",
                    "2 minutes ago",
                  ),

                  activityCard(
                    Icons.person_add,
                    Colors.blue,
                    "New User Registered",
                    "15 minutes ago",
                  ),

                  activityCard(
                    Icons.edit,
                    Colors.orange,
                    "Notice Updated",
                    "1 hour ago",
                  ),

                  activityCard(
                    Icons.backup,
                    Colors.purple,
                    "System Backup Completed",
                    "2 hours ago",
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget analyticsCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 4,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
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
              size: 40,
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

  Widget growthCard(
    String title,
    String percent,
    double value,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 4,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),

      child: Padding(
        padding: const EdgeInsets.all(18),

        child: Column(
          children: [

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  percent,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            LinearProgressIndicator(
              value: value,
              minHeight: 10,
              borderRadius:
                  BorderRadius.circular(10),
            ),
          ],
        ),
      ),
    );
  }

  Widget healthTile(
    String title,
    String status,
    Color color,
    IconData icon,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),

      title: Text(title),

      trailing: Text(
        status,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget activityCard(
    IconData icon,
    Color color,
    String title,
    String time,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),

      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              color.withOpacity(0.15),

          child: Icon(
            icon,
            color: color,
          ),
        ),

        title: Text(title),

        subtitle: Text(time),
      ),
    );
  }
}