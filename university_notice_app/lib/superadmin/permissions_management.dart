import 'package:flutter/material.dart';

class PermissionsManagementScreen extends StatefulWidget {
  const PermissionsManagementScreen({super.key});

  @override
  State<PermissionsManagementScreen> createState() =>
      _PermissionsManagementScreenState();
}

class _PermissionsManagementScreenState
    extends State<PermissionsManagementScreen> {

  bool createNotice = true;
  bool editNotice = true;
  bool deleteNotice = false;
  bool manageUsers = false;
  bool manageDepartments = true;
  bool manageCategories = true;
  bool viewReports = true;
  bool backupRestore = false;

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
                        Icons.security,
                        size: 50,
                        color: Colors.deepPurple,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "Permission Management",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Control Admin Access Rights",
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

                  // SELECT ADMIN
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20),
                    ),

                    child: const ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.person,
                        ),
                      ),

                      title: Text(
                        "Dr. Raj Sharma",
                      ),

                      subtitle: Text(
                        "CSE Department Admin",
                      ),

                      trailing: Icon(
                        Icons.keyboard_arrow_down,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // SUMMARY CARD
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.deepPurple.shade400,
                          Colors.deepPurple.shade700,
                        ],
                      ),

                      borderRadius:
                          BorderRadius.circular(20),
                    ),

                    child: const Column(
                      children: [

                        Icon(
                          Icons.admin_panel_settings,
                          color: Colors.white,
                          size: 45,
                        ),

                        SizedBox(height: 10),

                        Text(
                          "Admin Access Control",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          "Configure administrator permissions",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  permissionTile(
                    Icons.add_circle,
                    "Create Notices",
                    createNotice,
                    (value) {
                      setState(() {
                        createNotice = value;
                      });
                    },
                  ),

                  permissionTile(
                    Icons.edit,
                    "Edit Notices",
                    editNotice,
                    (value) {
                      setState(() {
                        editNotice = value;
                      });
                    },
                  ),

                  permissionTile(
                    Icons.delete,
                    "Delete Notices",
                    deleteNotice,
                    (value) {
                      setState(() {
                        deleteNotice = value;
                      });
                    },
                  ),

                  permissionTile(
                    Icons.people,
                    "Manage Users",
                    manageUsers,
                    (value) {
                      setState(() {
                        manageUsers = value;
                      });
                    },
                  ),

                  permissionTile(
                    Icons.school,
                    "Manage Departments",
                    manageDepartments,
                    (value) {
                      setState(() {
                        manageDepartments = value;
                      });
                    },
                  ),

                  permissionTile(
                    Icons.category,
                    "Manage Categories",
                    manageCategories,
                    (value) {
                      setState(() {
                        manageCategories = value;
                      });
                    },
                  ),

                  permissionTile(
                    Icons.analytics,
                    "View Reports",
                    viewReports,
                    (value) {
                      setState(() {
                        viewReports = value;
                      });
                    },
                  ),

                  permissionTile(
                    Icons.backup,
                    "Backup & Restore",
                    backupRestore,
                    (value) {
                      setState(() {
                        backupRestore = value;
                      });
                    },
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton.icon(
                      onPressed: () {},

                      icon: const Icon(
                        Icons.save,
                        color: Colors.white,
                      ),

                      label: const Text(
                        "Save Permissions",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),

                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.deepPurple,
                        padding:
                            const EdgeInsets.symmetric(
                          vertical: 18,
                        ),

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                                  15),
                        ),
                      ),
                    ),
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

  Widget permissionTile(
    IconData icon,
    String title,
    bool value,
    Function(bool) onChanged,
  ) {
    return Card(
      elevation: 4,

      margin: const EdgeInsets.only(
        bottom: 12,
      ),

      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18),
      ),

      child: SwitchListTile(
        value: value,

        onChanged: onChanged,

        secondary: Icon(
          icon,
          color: Colors.deepPurple,
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}