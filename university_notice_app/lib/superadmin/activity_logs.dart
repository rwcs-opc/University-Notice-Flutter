import 'package:flutter/material.dart';

class ActivityLogsScreen extends StatelessWidget {
  const ActivityLogsScreen({super.key});

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
            backgroundColor: Colors.deepPurple,

            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff4C1D95),
                      Color(0xff7C3AED),
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
                        Icons.history,
                        size: 50,
                        color: Colors.deepPurple,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "Activity Logs",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Track all system activities",
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
                children: [

                  // STATS CARD
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(20),

                      child: Row(
                        children: [

                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.circular(15),
                            ),

                            child: const Icon(
                              Icons.analytics,
                              size: 40,
                              color: Colors.deepPurple,
                            ),
                          ),

                          const SizedBox(width: 15),

                          const Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              Text(
                                "1,248",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),

                              Text(
                                "Total Activities",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // SEARCH BAR
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search activity logs",

                      prefixIcon:
                          const Icon(Icons.search),

                      suffixIcon:
                          const Icon(Icons.filter_list),

                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // TIMELINE LOGS
                  activityCard(
                    icon: Icons.add_circle,
                    iconColor: Colors.green,
                    title:
                        "Admin Raj Sharma created a new notice",
                    subtitle:
                        "Semester Examination Schedule",
                    role: "Admin",
                    time: "2 minutes ago",
                  ),

                  activityCard(
                    icon: Icons.edit,
                    iconColor: Colors.orange,
                    title:
                        "Admin Priya Singh updated a notice",
                    subtitle:
                        "Placement Drive Notice",
                    role: "Admin",
                    time: "10 minutes ago",
                  ),

                  activityCard(
                    icon: Icons.delete,
                    iconColor: Colors.red,
                    title:
                        "Super Admin removed a department",
                    subtitle:
                        "Old Department Record",
                    role: "Super Admin",
                    time: "30 minutes ago",
                  ),

                  activityCard(
                    icon: Icons.person_add,
                    iconColor: Colors.blue,
                    title:
                        "New user registered successfully",
                    subtitle:
                        "Student Registration",
                    role: "User",
                    time: "1 hour ago",
                  ),

                  activityCard(
                    icon: Icons.security,
                    iconColor: Colors.purple,
                    title:
                        "Permission settings updated",
                    subtitle:
                        "Admin Access Modified",
                    role: "Super Admin",
                    time: "2 hours ago",
                  ),

                  activityCard(
                    icon: Icons.backup,
                    iconColor: Colors.teal,
                    title:
                        "Database backup completed",
                    subtitle:
                        "Automatic Daily Backup",
                    role: "System",
                    time: "4 hours ago",
                  ),

                  activityCard(
                    icon: Icons.login,
                    iconColor: Colors.indigo,
                    title:
                        "Admin logged into the system",
                    subtitle:
                        "Successful Authentication",
                    role: "Admin",
                    time: "5 hours ago",
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget activityCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String role,
    required String time,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),

      child: Card(
        elevation: 5,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),

        child: Padding(
          padding: const EdgeInsets.all(18),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                padding: const EdgeInsets.all(12),

                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),

                child: Icon(
                  icon,
                  color: iconColor,
                  size: 30,
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [

                        Chip(
                          backgroundColor:
                              Colors.deepPurple
                                  .withOpacity(0.1),

                          label: Text(
                            role,
                            style: const TextStyle(
                              color:
                                  Colors.deepPurple,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),

                        const Spacer(),

                        Text(
                          time,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}