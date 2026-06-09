import 'package:flutter/material.dart';

import 'admin_dashboard.dart';
import 'create_notice.dart';
import 'user_management.dart';
import 'admin_notices_screen.dart';
import 'admin_settings_screen.dart';

class AdminBottomNav extends StatefulWidget {
  const AdminBottomNav({super.key});

  @override
  State<AdminBottomNav> createState() =>
      _AdminBottomNavState();
}

class _AdminBottomNavState
    extends State<AdminBottomNav> {

  int selectedIndex = 0;

  final List<Widget> pages = [
    const AdminDashboard(),
    const AdminNoticesScreen(),
    const CreateNoticeScreen(),
    const UserManagementScreen(),
    const AdminSettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,

        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        destinations: const [

          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),

          NavigationDestination(
            icon: Icon(Icons.description),
            label: "Notices",
          ),

          NavigationDestination(
            icon: Icon(Icons.add_circle),
            label: "Create",
          ),

          NavigationDestination(
            icon: Icon(Icons.people),
            label: "Users",
          ),

          NavigationDestination(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}