import 'package:flutter/material.dart';

class AdminSettingsScreen extends StatefulWidget {
  const AdminSettingsScreen({super.key});

  @override
  State<AdminSettingsScreen> createState() =>
      _AdminSettingsScreenState();
}

class _AdminSettingsScreenState
    extends State<AdminSettingsScreen> {

  bool notifications = true;
  bool darkMode = false;
  bool emailAlerts = true;
  bool autoBackup = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: Colors.indigo,

            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff283593),
                      Color(0xff5C6BC0),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),

                child: SafeArea(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: [

                      Container(
                        padding:
                            const EdgeInsets.all(4),

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                          shape: BoxShape.circle,
                        ),

                        child: const CircleAvatar(
                          radius: 45,
                          backgroundImage:
                              NetworkImage(
                            "https://i.pravatar.cc/300",
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        "System Administrator",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        "admin@university.edu",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius:
                              BorderRadius.circular(
                                  20),
                        ),

                        child: const Text(
                          "SYSTEM ONLINE",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.all(16),

              child: Column(
                children: [

                  Row(
                    children: [

                      Expanded(
                        child: statCard(
                          "Users",
                          "1,385",
                          Icons.people,
                          Colors.blue,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: statCard(
                          "Notices",
                          "120",
                          Icons.description,
                          Colors.green,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: statCard(
                          "Admins",
                          "12",
                          Icons.admin_panel_settings,
                          Colors.orange,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  sectionTitle(
                    "Application Settings",
                  ),

                  settingsCard(
                    icon: Icons.notifications,
                    iconColor: Colors.orange,
                    title: "Push Notifications",
                    subtitle:
                        "Enable notifications",
                    trailing: Switch(
                      value: notifications,
                      onChanged: (value) {
                        setState(() {
                          notifications =
                              value;
                        });
                      },
                    ),
                  ),

                  settingsCard(
                    icon: Icons.dark_mode,
                    iconColor: Colors.indigo,
                    title: "Dark Mode",
                    subtitle:
                        "Enable dark theme",
                    trailing: Switch(
                      value: darkMode,
                      onChanged: (value) {
                        setState(() {
                          darkMode = value;
                        });
                      },
                    ),
                  ),

                  settingsCard(
                    icon: Icons.email,
                    iconColor: Colors.red,
                    title: "Email Alerts",
                    subtitle:
                        "Send email updates",
                    trailing: Switch(
                      value: emailAlerts,
                      onChanged: (value) {
                        setState(() {
                          emailAlerts =
                              value;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 25),

                  sectionTitle(
                    "Security",
                  ),

                  settingsTile(
                    Icons.lock,
                    Colors.green,
                    "Change Password",
                  ),

                  settingsTile(
                    Icons.security,
                    Colors.red,
                    "Security Settings",
                  ),

                  settingsTile(
                    Icons.verified_user,
                    Colors.blue,
                    "Admin Permissions",
                  ),

                  const SizedBox(height: 25),

                  sectionTitle(
                    "Database & Backup",
                  ),

                  settingsCard(
                    icon: Icons.backup,
                    iconColor: Colors.purple,
                    title: "Automatic Backup",
                    subtitle:
                        "Daily backup enabled",
                    trailing: Switch(
                      value: autoBackup,
                      onChanged: (value) {
                        setState(() {
                          autoBackup =
                              value;
                        });
                      },
                    ),
                  ),

                  settingsTile(
                    Icons.cloud_upload,
                    Colors.blue,
                    "Backup Now",
                  ),

                  settingsTile(
                    Icons.restore,
                    Colors.green,
                    "Restore Database",
                  ),

                  const SizedBox(height: 25),

                  sectionTitle(
                    "Reports & Analytics",
                  ),

                  settingsTile(
                    Icons.analytics,
                    Colors.orange,
                    "View Reports",
                  ),

                  settingsTile(
                    Icons.bar_chart,
                    Colors.indigo,
                    "Usage Analytics",
                  ),

                  const SizedBox(height: 25),

                  sectionTitle(
                    "About",
                  ),

                  Card(
                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                              20),
                    ),

                    child: const Padding(
                      padding:
                          EdgeInsets.all(20),

                      child: Column(
                        children: [

                          Icon(
                            Icons.school,
                            size: 50,
                            color: Colors.indigo,
                          ),

                          SizedBox(height: 10),

                          Text(
                            "University Notice Management System",
                            textAlign:
                                TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            "Version 1.0.0",
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton.icon(
                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.red,
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      15),
                        ),
                      ),

                      onPressed: () {},

                      icon: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),

                      label: const Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding:
          const EdgeInsets.only(
        bottom: 12,
        top: 8,
      ),

      child: Align(
        alignment:
            Alignment.centerLeft,

        child: Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget statCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 4,

      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18),
      ),

      child: Padding(
        padding:
            const EdgeInsets.all(12),

        child: Column(
          children: [

            Icon(
              icon,
              color: color,
            ),

            const SizedBox(height: 8),

            Text(
              value,
              style: const TextStyle(
                fontWeight:
                    FontWeight.bold,
                fontSize: 20,
              ),
            ),

            Text(title),
          ],
        ),
      ),
    );
  }

  Widget settingsCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required Widget trailing,
  }) {
    return Card(
      margin:
          const EdgeInsets.only(
        bottom: 12,
      ),

      shape:
          RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(
                18),
      ),

      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              iconColor.withOpacity(
                  0.15),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),

        title: Text(title),
        subtitle: Text(subtitle),
        trailing: trailing,
      ),
    );
  }

  Widget settingsTile(
    IconData icon,
    Color color,
    String title,
  ) {
    return Card(
      margin:
          const EdgeInsets.only(
        bottom: 12,
      ),

      shape:
          RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(
                18),
      ),

      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              color.withOpacity(
                  0.15),
          child: Icon(
            icon,
            color: color,
          ),
        ),

        title: Text(title),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),

        onTap: () {},
      ),
    );
  }

}