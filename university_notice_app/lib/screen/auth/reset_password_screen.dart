import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;

  const ResetPasswordScreen({
    super.key,
    required this.email,
  });

  @override
  State<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState
    extends State<ResetPasswordScreen> {

  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  final ApiService apiService = ApiService();

  bool isLoading = false;

  bool obscure1 = true;
  bool obscure2 = true;

  Future<void> resetPassword() async {

    if (passwordController.text.isEmpty ||
        confirmController.text.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields"),
        ),
      );

      return;
    }

    if (passwordController.text !=
        confirmController.text) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match"),
        ),
      );

      return;
    }

    setState(() {
      isLoading = true;
    });

    final result = await apiService.resetPassword(
      email: widget.email,
      password: passwordController.text,
      confirmPassword: confirmController.text,
    );

    setState(() {
      isLoading = false;
    });

    if (result["status"] == true) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result["message"]),
        ),
      );

      Navigator.popUntil(
        context,
        (route) => route.isFirst,
      );

    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result["message"]),
        ),
      );

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Reset Password"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Text(
              widget.email,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: passwordController,
              obscureText: obscure1,

              decoration: InputDecoration(
                labelText: "New Password",

                border: const OutlineInputBorder(),

                suffixIcon: IconButton(
                  icon: Icon(
                    obscure1
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      obscure1 = !obscure1;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: confirmController,
              obscureText: obscure2,

              decoration: InputDecoration(
                labelText: "Confirm Password",

                border: const OutlineInputBorder(),

                suffixIcon: IconButton(
                  icon: Icon(
                    obscure2
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      obscure2 = !obscure2;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(

                onPressed:
                    isLoading ? null : resetPassword,

                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        "Reset Password",
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}