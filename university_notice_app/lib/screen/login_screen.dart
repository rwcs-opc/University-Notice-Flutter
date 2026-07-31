
//temporarly

import 'package:flutter/material.dart';
import '../services/api_service.dart';

import 'register_screen.dart';
import 'bottom_nav_screen.dart';
import '../admin/admin_dashboard.dart';
import '../superadmin/superadmindashboard.dart';
import '../admin/admin_bottom_nav.dart';
import '../superadmin/super_admin_nav.dart';
import 'auth/forgot_password_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();
      final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: [

                const Icon(
                  Icons.school,
                  size: 80,
                  color: Colors.blue,
                ),

                const SizedBox(height: 15),

                const Text(
                  "University Notice Management",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),

                const SizedBox(height: 10),

                // Align(
                //   alignment: Alignment.centerRight,
                //   child: TextButton(
                //     onPressed: () {},
                //     child: const Text(
                //       "Forgot Password?",
                //     ),
                //   ),
                // ),
                Align(
  alignment: Alignment.centerRight,
  child: TextButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        ),
      );
    },
    child: const Text(
      "Forgot Password?",
    ),
  ),
),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(
                    /////
                    ///
                    ///
                    ///
        






                    // onPressed: () {

                    //   String email =
                    //       emailController.text.trim();

                    //   String password =
                    //       passwordController.text.trim();

                    //   // USER LOGIN

                    //   if (email == "user" &&
                    //       password == "123") {

                    //     Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (_) =>
                    //             const BottomNavScreen(),
                    //       ),
                    //     );
                    //   }

                    //   // ADMIN LOGIN

                    //   else if (email == "admin" &&
                    //       password == "123") {

                    //     Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const AdminBottomNav(),
                    //       ),
                    //     );
                    //   }

                    //   // SUPER ADMIN LOGIN

                    //   else if (email == "sadmin" &&
                    //       password == "123") {

                    //     Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //        builder: (context) => const SuperAdminNav(),
                    //       ),
                    //     );
                    //   }

                    //   // INVALID LOGIN

                    //   else {

                    //     ScaffoldMessenger.of(context)
                    //         .showSnackBar(
                    //       const SnackBar(
                    //         content: Text(
                    //           "Invalid Credentials",
                    //         ),
                    //       ),
                    //     );
                    //   }
                    // },

onPressed: () async {

  String email = emailController.text.trim();
  String password = passwordController.text.trim();

  final result = await apiService.login(
    email,
    password,
  );

  if (result["status"] == true) {

    String role = result["user"]["role"];

    if (role == "user") {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const BottomNavScreen(),
        ),
      );

    } else if (role == "admin") {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const AdminBottomNav(),
        ),
      );

    } else if (role == "super_admin") {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const SuperAdminNav(),
        ),
      );

    }

  } else {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(result["message"]),
      ),
    );

  }

},
























                    //
                    //

                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [

                    const Text(
                      "Don't have an account?",
                    ),

                    TextButton(
                      onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const RegisterScreen(),
                          ),
                        );
                      },

                      child: const Text(
                        "Sign Up",
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                Card(
                  color: Colors.grey.shade100,

                  child: const Padding(
                    padding: EdgeInsets.all(12),

                    child: Column(
                      children: [

                        Text(
                          "Temporary Test Accounts",
                          style: TextStyle(
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          "User → user / 123",
                        ),

                        Text(
                          "Admin → admin / 123",
                        ),

                        Text(
                          "Super Admin → sadmin / 123",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
