import 'package:app/auth/auth_button.dart';
import 'package:flutter/material.dart';
import 'auth_form.dart'; // Importing the AuthForm widget file

import 'login_page.dart';
import 'otp_verification_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Forgot Password'),
      // ),
      body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
          ),
          ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forgot Your Password?',
              textAlign: TextAlign.start,

              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Enter your email address below to receive a password reset link.',
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 20),
            // Replace TextFormField with AuthForm for email input
            AuthForm(
              labelText: 'Email',
              obscureText: false,
            ),
            SizedBox(height: 20),
            AuthButton(
              onPressed: () {
                // Add logic to send password reset link and navigate to OTP verification page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OTPVerificationPage()),
                );
              },
              text: 'Reset Password',
            ),
          ],
        ),
      ),
    );
  }
}



