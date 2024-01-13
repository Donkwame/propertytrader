import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:propertytrader/login.dart';

class Swap1 extends StatelessWidget {
  final VoidCallback onLogoutFailed;
  final VoidCallback onLogoutSuccess;
  final Logger logger = Logger();

   Swap1({
    super.key,
    required this.onLogoutFailed,
    required this.onLogoutSuccess,
  });

  // Function to handle user logout
  void signUserOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate to a different page after successful logout
      (
        context,
        MaterialPageRoute(builder: (context) => const Login()), // Replace with the page you want to navigate to
      );
      // Invoke the onLogoutSuccess callback after successful logout
      onLogoutSuccess();
    } catch (error) {
      logger.e('Logout failed: $error');
      // Invoke the onLogoutFailed callback if logout fails
      onLogoutFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => signUserOut(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(child: Text("LOGGED IN")),
    );
  }
}


