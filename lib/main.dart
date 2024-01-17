import 'package:flutter/material.dart';
import 'package:propertytrader/login_signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // Use AuthPage() to create an instance
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 5, 21, 46), // Set the background color to dark blue
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Align elements at the top
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image at the top
          Container(
            height: 480,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
              child: Image.asset(
                'lib/Start.png', // Replace with the actual image path
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Welcome message in the middle
          const Text(
            'Hello',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Set text color to white
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            'Welcome  to the most comprehensive  property exchange platform to swap all good and services safely and securely',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Set text color to white
            ),
          ),
          const SizedBox(height: 40),

          // Button that leads to a new page at the bottom

          // Button that leads to a new page at the bottom
          ElevatedButton(
            onPressed: () {
              // Navigate to the SecondPage when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginSignup()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(
                  255, 48, 5, 132), // Set button background color
              fixedSize: const Size(500, 50), // Set button height and width
            ),
            child: const Text(
              'Get Started',
              style: TextStyle(
                  color: Color.fromARGB(
                      255, 203, 200, 207)), // Set text color to white
            ),
          ),
        ],
      ),
    );
  }
}
