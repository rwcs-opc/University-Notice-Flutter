import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'package:university_notice_app/Home/home.dart';
import 'bottom_nav_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("login",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),


              //foget ppassword
              Align(
  alignment: Alignment.centerRight,
  child: TextButton(
    onPressed: () {
      // Navigate to forgot password screen
    },
    child: const Text("Forgot Password?"),
  ),
),


              // SizedBox(height: 30),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text("Login"),
              // ),

              SizedBox(height: 30),

ElevatedButton(
  onPressed: () {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BottomNavScreen(),
      ),
    );

  },

  child: const Text("Login"),
),
              //sing up now
              Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    const Text("Don't have an account?"),
    TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterScreen()),
        );
        // Navigate to sign up screen
      },
      child: const Text("Sign Up"),
    ),
  ],
),


            ],
            
          ),
        ),
      ),
    );
  }
}
