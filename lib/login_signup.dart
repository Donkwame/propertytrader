import 'dart:async';
import 'package:flutter/material.dart';
import 'package:propertytrader/login.dart';
import 'package:propertytrader/signup.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginSignupState createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  final List<String> imagePaths = [
    'lib/Start1.jpg',
    'lib/Start2.jpg',
    // Add more image paths as needed
  ];

  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < imagePaths.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Slideshow using PageView
          PageView.builder(
            controller: _pageController,
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return Image.asset(
                imagePaths[index],
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              );
            },
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
          // Colored overlay with transparency
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height * 0.5,
              color: const Color.fromARGB(162, 94, 10, 228).withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ready to explore?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Logiin button
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle the first button action
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Login()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color.fromARGB(
                                    255, 114, 33, 243)
                                .withOpacity(0.5), // Set text color to white
                            side: const BorderSide(
                                color: Colors.white,
                                width: 2), // Add white borders
                            fixedSize: const Size(
                                200, 50), // Set button height and width
                          ),
                          child: const Text(
                            'Log in',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(height: 50),

                        // sign up button

                        // Add spacing between buttons
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  SignUp()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 48, 5, 132),
                            side: const BorderSide(
                                color: Colors.white,
                                width: 2), // Set button background color
                            fixedSize: const Size(200, 50),
                          ),
                          child: const Text(
                            'Create Account',
                            style: TextStyle(
                              color: Color.fromARGB(255, 203, 200, 207),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
