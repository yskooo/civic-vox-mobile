import 'package:flutter/material.dart';
import 'auth_form.dart';
import 'home_page.dart';
import 'user_sign_up_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            top: 20,
            left: 0,
            right: 0,
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 0.5, // Adjust the width factor as needed
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
                padding: const EdgeInsets.all(5),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7, // Set the height of the container
                  decoration: BoxDecoration(
                    color: Color(0xFFD3DFF6), // Background color of forms
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)), // Rounded top corners
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 10), // Adjust the spacing between text and icon
                          ],
                        ),
                        SizedBox(height: 20),
                        AuthForm(
                          labelText: 'Email',
                          obscureText: false,
                        ),
                        SizedBox(height: 20),
                        AuthForm(
                          labelText: 'Password',
                          obscureText: true,
                        ),
                        SizedBox(height: 20),
                        AuthButton(
                          text: 'Log In',
                          onPressed: () {
                            // Simulated authentication logic (replace with actual logic)
                            String email = 'user@example.com';
                            String password = 'password';
                            if (true) {
                              // Condition to validate credentials
                              Navigator.pushReplacement(
                                // Navigate to home page
                                context,
                                MaterialPageRoute(builder: (context) => HomePage()),
                              );
                            } else {
                              // Show error message for invalid credentials
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text('Invalid email or password.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            // Add Forgot Password logic here
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(height: 50),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account yet? ',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to login page
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => UserSignUpPage(),
                                ));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:  Colors.black,
                                minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
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

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AuthButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF000AFF), // Button background color
        minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}


