import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CIVIC VOX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://is1-ssl.mzstatic.com/image/thumb/Purple113/v4/a2/73/8f/a2738fd3-9a77-6503-b50b-df7d86223845/AppIcon-0-0-1x_U007emarketing-0-0-0-10-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/512x512bb.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'CIVIC VOX',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(
                        //   'Login',
                        //   style: TextStyle(
                        //     color: Colors.blue,
                        //     fontSize: 26,
                        //     // fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        SizedBox(width: 10), // Adjust the spacing between text and icon
                        Icon(
                          Icons.person_rounded,
                          color: Colors.blue,
                          size: 60,
                        ),
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
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        // Add Forgot Password logic here
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );                      },
                      child: Text(
                        'Don\'t have an account? Sign Up',
                        style: TextStyle(color: Colors.black),
                      ),
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

class AuthForm extends StatelessWidget {
  final String labelText;
  final bool obscureText;

  const AuthForm({
    Key? key,
    required this.labelText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelText: labelText,
      ),
      obscureText: obscureText,
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
        backgroundColor: Colors.black,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
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
