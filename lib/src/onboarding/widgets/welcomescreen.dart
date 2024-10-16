import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiddie/constants/resource.dart';

class Welcomescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image and color
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  R.ASSETS_IMAGES_ONBOARDING4_PNG,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFF8FE3D4), // Mint green color
                ),
              ),
            ],
          ),

          // Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App logo and name
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.favorite, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Kiddie',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                Spacer(),

                // Main text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    'Track your\nPregnant journey',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                Spacer(),

                // Buttons
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          context.go('/home');
                        },
                        child: Text('Get Started'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1E5653), // Dark teal color
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Already have an account? Sign in',
                          style: TextStyle(color: Color(0xFF1E5653)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
