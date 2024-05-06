import 'package:app/auth/auth_button.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'auth_form.dart';

class PasswordResetPage extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                AuthForm(
                  labelText: 'New Password',
                  obscureText: true,
                ),
                AuthForm(
                  labelText: 'Confirm Password',
                  obscureText: true,
                ),
                SizedBox(height: 20),
                AuthButton(
                  onPressed: () {
                    // Add logic to reset password
                    // For demonstration, navigate back to login page after resetting password
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => PasswordResetConfirmationPage()),
                    );
                  },
                  text: 'Update Password',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordResetConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  size: 50,
                  color: Colors.blue,
                ),
                SizedBox(height: 20),
                Text(
                  'Congratulations! Your password has been changed. Click continue to login',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                AuthButton(
                  onPressed: () {
                    // Navigate to continue to login or any other page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  text: 'Continue',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}