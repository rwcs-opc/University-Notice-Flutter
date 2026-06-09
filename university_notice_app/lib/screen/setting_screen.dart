import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screen/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() =>
      _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool darkMode = false;
  bool notifications = true;

  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [

          const Text(
            "Preferences",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),

            child: SwitchListTile(
              secondary: const Icon(
                Icons.dark_mode,
                color: Colors.indigo,
              ),

              title: const Text("Dark Mode"),

              subtitle: const Text(
                "Enable dark theme",
              ),

              value: darkMode,

              // onChanged: (value) {
              //   setState(() {
              //     darkMode = value;
              //   });
              // },
              onChanged: (value) {
                 Provider.of<ThemeNotifier>(
    context,
    listen: false,
  ).toggleTheme(value);

  setState(() {
    darkMode = value;
  });
},
            ),
          ),

          const SizedBox(height: 12),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),

            child: SwitchListTile(
              secondary: const Icon(
                Icons.notifications,
                color: Colors.orange,
              ),

              title: const Text(
                "Notifications",
              ),

              subtitle: const Text(
                "Receive notice alerts",
              ),

              value: notifications,

              onChanged: (value) {
                setState(() {
                  notifications = value;
                });
              },
            ),
          ),

          const SizedBox(height: 12),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),

            child: ListTile(
              leading: const Icon(
                Icons.language,
                color: Colors.green,
              ),

              title: const Text(
                "Language",
              ),

              subtitle: Text(
                selectedLanguage,
              ),

              trailing: DropdownButton<String>(
                value: selectedLanguage,

                underline: const SizedBox(),

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
                    selectedLanguage = value!;
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "About",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),

            child: const ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.blue,
              ),

              title: Text(
                "About App",
              ),

              subtitle: Text(
                "University Notice Management System\nVersion 1.0.0",
              ),
            ),
          ),
        ],
      ),
    );
  }
}