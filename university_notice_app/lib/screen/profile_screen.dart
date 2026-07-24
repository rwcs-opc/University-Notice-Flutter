
import 'package:flutter/material.dart';
import 'notification_screen.dart';
//import 'saved_screen.dart';
import 'edit_profile_screen.dart';
import '../screen/change_password_screen.dart';
import '../screen/setting_screen.dart';
import '../screen/help_and_support.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // TOP PROFILE SECTION
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 30,
              ),

              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              child: Column(
                children: [

                  // PROFILE IMAGE
                  Stack(
                    children: [

                      const CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/300',
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // NAME
                  const Text(
                    "Milan Sharma",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  // EMAIL
                  const Text(
                    "milan@gmail.com",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // ROLE BADGE
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 8,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: const Text(
                      "Student",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // PROFILE OPTIONS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [

                  profileTile(
  Icons.person,
  "Edit Profile",
  Colors.blue,
  () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EditProfileScreen(),
      ),
    );
  },
),

                  profileTile(
  Icons.notifications,
  "Notifications",
  Colors.orange,
  () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NotificationScreen(),
      ),
    );
  },
),

//                   profileTile(
//   Icons.bookmark,
//   "Saved Notices",
//   Colors.green,
//   () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const SavedScreen(),
//       ),
//     );
//   },
// ),

                  profileTile(
  Icons.lock,
  "Change Password",
  Colors.red,
  () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const ChangePasswordScreen(),
      ),
    );
  },
),

                  profileTile(
  Icons.settings,
  "Settings",
  Colors.grey,
  () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const SettingsScreen(),
      ),
    );
  },
),

                  profileTile(
  Icons.help_outline,
  "Help & Support",
  Colors.orange,
  () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const HelpSupportScreen(),
      ),
    );
  },
),
profileTile(
  Icons.logout,
  "Logout",
  Colors.red,
  () {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const LoginScreen(),
      ),
      (route) => false,
    );
  },
),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // LOGOUT BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  onPressed: () {

                    // LOGOUT FUNCTION

                  },

                  icon: const Icon(Icons.logout),

                  label: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // PROFILE TILE WIDGET
 Widget profileTile(
  IconData icon,
  String title,
  Color color,
  VoidCallback onTap,
) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),

    child: Card(
      elevation: 2,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),

      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),

        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),

          child: Icon(
            icon,
            color: color,
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),

        onTap: onTap, // <-- use the passed function
      ),
    ),
  );
}
}
