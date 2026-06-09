// import 'package:flutter/material.dart';
// import 'register_screen.dart';
// import 'package:university_notice_app/Home/home.dart';
// import 'bottom_nav_screen.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
      
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text("login",
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//               ),),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: "Email",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   border: OutlineInputBorder(),
//                 ),
//               ),


//               //foget ppassword
//               Align(
//   alignment: Alignment.centerRight,
//   child: TextButton(
//     onPressed: () {
//       // Navigate to forgot password screen
//     },
//     child: const Text("Forgot Password?"),
//   ),
// ),


//               // SizedBox(height: 30),
//               // ElevatedButton(
//               //   onPressed: () {},
//               //   child: Text("Login"),
//               // ),

//               SizedBox(height: 30),

// ElevatedButton(
//   onPressed: () {

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const BottomNavScreen(),
//       ),
//     );

//   },

//   child: const Text("Login"),
// ),
//               //sing up now
//               Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     const Text("Don't have an account?"),
//     TextButton(
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const RegisterScreen()),
//         );
//         // Navigate to sign up screen
//       },
//       child: const Text("Sign Up"),
//     ),
//   ],
// ),


//             ],
            
//           ),
//         ),
//       ),
//     );
//   }
// }












//temporarly

import 'package:flutter/material.dart';

import 'register_screen.dart';
import 'bottom_nav_screen.dart';
import '../admin/admin_dashboard.dart';
import '../superadmin/superadmindashboard.dart';
import '../admin/admin_bottom_nav.dart';

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

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
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
                    onPressed: () {

                      String email =
                          emailController.text.trim();

                      String password =
                          passwordController.text.trim();

                      // USER LOGIN

                      if (email == "user" &&
                          password == "123") {

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const BottomNavScreen(),
                          ),
                        );
                      }

                      // ADMIN LOGIN

                      else if (email == "admin" &&
                          password == "123") {

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AdminBottomNav(),
                          ),
                        );
                      }

                      // SUPER ADMIN LOGIN

                      else if (email == "sadmin" &&
                          password == "123") {

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const SuperAdminDashboard(),
                          ),
                        );
                      }

                      // INVALID LOGIN

                      else {

                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Invalid Credentials",
                            ),
                          ),
                        );
                      }
                    },

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
