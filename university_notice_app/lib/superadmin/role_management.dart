import 'package:flutter/material.dart';

class RoleManagementScreen extends StatelessWidget {
  const RoleManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.indigo,
        onPressed: () {},
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: const Text(
          "Create Role",
          style: TextStyle(color: Colors.white),
        ),
      ),

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
                        Icons.manage_accounts,
                        size: 50,
                        color: Colors.indigo,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "Role Management",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Manage System Roles & Access",
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

                  // TOTAL ROLES CARD
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
                              color: Colors.indigo.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.circular(15),
                            ),

                            child: const Icon(
                              Icons.groups,
                              color: Colors.indigo,
                              size: 40,
                            ),
                          ),

                          const SizedBox(width: 15),

                          const Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [

                              Text(
                                "3",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),

                              Text(
                                "Available Roles",
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
                      hintText: "Search Roles",

                      prefixIcon:
                          const Icon(Icons.search),

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

                  roleCard(
                    roleName: "Super Admin",
                    description:
                        "Complete control over the entire system",
                    users: "1 User",
                    color: Colors.red,
                    icon: Icons.workspace_premium,
                  ),

                  roleCard(
                    roleName: "Admin",
                    description:
                        "Manage notices, departments and users",
                    users: "18 Users",
                    color: Colors.blue,
                    icon: Icons.admin_panel_settings,
                  ),

                  roleCard(
                    roleName: "Student/User",
                    description:
                        "View notices and update profile",
                    users: "1250 Users",
                    color: Colors.green,
                    icon: Icons.person,
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget roleCard({
    required String roleName,
    required String description,
    required String users,
    required Color color,
    required IconData icon,
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

          child: Column(
            children: [

              Row(
                children: [

                  CircleAvatar(
                    radius: 30,
                    backgroundColor:
                        color.withOpacity(0.15),

                    child: Icon(
                      icon,
                      color: color,
                      size: 35,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          roleName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          description,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),

                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius:
                      BorderRadius.circular(12),
                ),

                child: Row(
                  children: [

                    const Icon(
                      Icons.people,
                      color: Colors.indigo,
                    ),

                    const SizedBox(width: 8),

                    Text(
                      users,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              Row(
                children: [

                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},

                      icon: const Icon(
                        Icons.visibility,
                      ),

                      label: const Text(
                        "Permissions",
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},

                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),

                      label: const Text(
                        "Edit",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}