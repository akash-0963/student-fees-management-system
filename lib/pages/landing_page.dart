import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to Student Fees Management System',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Text(
              'Features:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Text(
              '- Manage student fees and payments',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            Text(
              '- View payment history and status',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            // Add more feature descriptions if needed
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to login or registration screen
                // Replace 'LoginScreen' and 'RegistrationScreen' with your own screen names
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                'Get Started',
                style: TextStyle(fontSize: 18.0),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
