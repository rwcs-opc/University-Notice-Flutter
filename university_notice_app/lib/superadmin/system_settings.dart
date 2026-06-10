import 'package:flutter/material.dart';

class SystemSettingsScreen extends StatefulWidget {
  const SystemSettingsScreen({super.key});

  @override
  State<SystemSettingsScreen> createState() =>
      _SystemSettingsScreenState();
}

class _SystemSettingsScreenState
    extends State<SystemSettingsScreen> {

  bool darkMode = false;
  bool notifications = true;
  bool maintenanceMode = false;
  bool autoBackup = true;

  String selectedLanguage = "English";

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
            backgroundColor: Colors.blueGrey,

            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff1E293B),
                      Color(0xff334155),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),

                child: const Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [

                    SizedBox(height: 40),

                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.settings,
                        size: 50,
                        color: Colors.blueGrey,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "System Settings",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Configure system preferences",
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

                  // APP SETTINGS
                  const Text(
                    "Application Settings",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  settingsSwitchTile(
                    Icons.dark_mode,
                    "Dark Mode",
                    "Enable dark theme",
                    darkMode,
                    (value) {
                      setState(() {
                        darkMode = value;
                      });
                    },
                  ),

                  settingsSwitchTile(
                    Icons.notifications,
                    "Notifications",
                    "Enable push notifications",
                    notifications,
                    (value) {
                      setState(() {
                        notifications = value;
                      });
                    },
                  ),

                  settingsSwitchTile(
                    Icons.build_circle,
                    "Maintenance Mode",
                    "Temporarily disable access",
                    maintenanceMode,
                    (value) {
                      setState(() {
                        maintenanceMode = value;
                      });
                    },
                  ),

                  settingsSwitchTile(
                    Icons.backup,
                    "Auto Backup",
                    "Automatic daily backup",
                    autoBackup,
                    (value) {
                      setState(() {
                        autoBackup = value;
                      });
                    },
                  ),

                  const SizedBox(height: 25),

                  // LANGUAGE
                  const Text(
                    "Language",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(18),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),

                      child: DropdownButtonFormField(
                        value: selectedLanguage,
                        decoration:
                            const InputDecoration(
                          border: InputBorder.none,
                        ),

                        items: const [

                          DropdownMenuItem(
                            value: "English",
                            child: Text("English"),
                          ),

                          DropdownMenuItem(
                            value: "Hindi",
                            child: Text("Hindi"),
                          ),

                          DropdownMenuItem(
                            value: "Bengali",
                            child: Text("Bengali"),
                          ),
                        ],

                        onChanged: (value) {
                          setState(() {
                            selectedLanguage =
                                value.toString();
                          });
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // SECURITY
                  const Text(
                    "Security Settings",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  settingsTile(
                    Icons.lock,
                    "Change Master Password",
                  ),

                  settingsTile(
                    Icons.security,
                    "Security Policies",
                  ),

                  settingsTile(
                    Icons.verified_user,
                    "Two Factor Authentication",
                  ),

                  const SizedBox(height: 25),

                  // DATABASE
                  const Text(
                    "Database Settings",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  settingsTile(
                    Icons.storage,
                    "Database Configuration",
                  ),

                  settingsTile(
                    Icons.cloud_sync,
                    "Cloud Synchronization",
                  ),

                  settingsTile(
                    Icons.download,
                    "Export Database",
                  ),

                  const SizedBox(height: 25),

                  // SYSTEM INFO
                  const Text(
                    "System Information",
                    style: TextStyle(
                      fontSize: 22,
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

                    child: const Padding(
                      padding: EdgeInsets.all(20),

                      child: Column(
                        children: [

                          ListTile(
                            leading: Icon(
                              Icons.info,
                              color: Colors.blue,
                            ),
                            title:
                                Text("Version"),
                            trailing:
                                Text("1.0.0"),
                          ),

                          Divider(),

                          ListTile(
                            leading: Icon(
                              Icons.memory,
                              color: Colors.green,
                            ),
                            title:
                                Text("Server"),
                            trailing:
                                Text("Online"),
                          ),

                          Divider(),

                          ListTile(
                            leading: Icon(
                              Icons.storage,
                              color: Colors.orange,
                            ),
                            title:
                                Text("Database"),
                            trailing:
                                Text("Connected"),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton.icon(
                      onPressed: () {},

                      icon: const Icon(
                        Icons.save,
                        color: Colors.white,
                      ),

                      label: const Text(
                        "Save Settings",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),

                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.blueGrey,
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

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget settingsSwitchTile(
    IconData icon,
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 4,

      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18),
      ),

      child: SwitchListTile(
        value: value,
        onChanged: onChanged,

        secondary: Icon(
          icon,
          color: Colors.blueGrey,
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(subtitle),
      ),
    );
  }

  Widget settingsTile(
    IconData icon,
    String title,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 4,

      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18),
      ),

      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.blueGrey,
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