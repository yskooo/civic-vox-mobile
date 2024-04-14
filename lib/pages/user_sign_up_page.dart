import 'package:flutter/material.dart';
import 'auth_form.dart';
import 'personal_sign_up_page.dart';

class UserSignUpPage extends StatelessWidget {
  const UserSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Logo at the top
          Positioned(
            top: screenHeight * 0.05,
            left: 0,
            right: 0,
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 0.5,
                child: Image.asset(
                  'assets/images/civicvoxlogo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // Content
          Positioned.fill(
            bottom: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Container(
                  height: screenHeight * 0.7,
                  decoration: BoxDecoration(
                    color: Color(0xFFD3DFF6),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: screenHeight * 0.02),
                          AuthForm(
                            labelText: 'Username',
                            obscureText: false,
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          AuthForm(
                            labelText: 'Email',
                            obscureText: false,
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          AuthForm(
                            labelText: 'Password',
                            obscureText: true,
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          AuthForm(
                            labelText: 'Confirm Password',
                            obscureText: true,
                          ),
                          SizedBox(height: screenHeight * 0.05),
                          NextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const PersonalSignUpPage()),
                              );
                            },
                          ),
                          SizedBox(height: screenHeight * 0.02), // Add some spacing at the bottom
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF000AFF),
        minimumSize: Size(MediaQuery.of(context).size.width * 0.9, MediaQuery.of(context).size.height * 0.07),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        'Next',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
