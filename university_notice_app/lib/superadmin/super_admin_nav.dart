import 'package:flutter/material.dart';

import 'superadminDashboard.dart';
import 'admin_management.dart';
import 'system_analytics.dart';
import 'system_settings.dart';

class SuperAdminNav extends StatefulWidget {
  const SuperAdminNav({super.key});

  @override
  State<SuperAdminNav> createState() => _SuperAdminNavState();
}

class _SuperAdminNavState extends State<SuperAdminNav> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    SuperAdminDashboard(),
    AdminManagementScreen(),
    SystemAnalyticsScreen(),
    SystemSettingsScreen(),
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
            icon: Icon(Icons.people),
            label: "Admins",
          ),

          NavigationDestination(
            icon: Icon(Icons.analytics),
            label: "Analytics",
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