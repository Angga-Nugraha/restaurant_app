import 'package:dicoding_restaurant_app/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Lottie.asset('assets/lottie/delivery-guy-waiting.json'),
              ),
              const Text(
                'R e s t a u r a n t',
                style: TextStyle(
                    fontFamily: 'Samantha',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: secondaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
