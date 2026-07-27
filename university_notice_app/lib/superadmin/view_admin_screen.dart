import 'package:flutter/material.dart';
import '../../models/user_model.dart';

class ViewAdminScreen extends StatelessWidget {
  final UserModel admin;

  const ViewAdminScreen({
    super.key,
    required this.admin,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Admin Profile"),
        backgroundColor: Colors.indigo,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const SizedBox(height: 20),

            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.indigo.shade100,
              child: const Icon(
                Icons.person,
                size: 60,
                color: Colors.indigo,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              admin.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              admin.email,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  children: [

                    ListTile(
                      leading: const Icon(Icons.badge),
                      title: const Text("Role"),
                      subtitle: Text(admin.role.toUpperCase()),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text("Email"),
                      subtitle: Text(admin.email),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text("Name"),
                      subtitle: Text(admin.name),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.verified_user),
                      title: const Text("Status"),
                      subtitle: const Text("Active"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}