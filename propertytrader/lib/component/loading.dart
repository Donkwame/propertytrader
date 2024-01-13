import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:propertytrader/swap1.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  // Simulate the loading process
  Future<void> loadData() async {
    if (_isDisposed) return;

    await Future.delayed(const Duration(seconds: 5));

    if (!_isDisposed) {
      navigateToNextPage();
    }
  }

  // Function to handle navigation to the next page
  void navigateToNextPage() {
    if (_isDisposed) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Swap1(
          onLogoutFailed: () {},
          onLogoutSuccess: () {},
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // Trigger loading after delay
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
          'https://lottie.host/a9d82d66-5649-4a4f-a8d8-dee4d2f00efc/gFAuMCOCMQ.json',
        ),
      ),
    );
  }
}
