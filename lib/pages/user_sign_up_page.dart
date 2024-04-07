import 'package:flutter/material.dart';
import 'address_sign_up_page.dart';
import '../main.dart';

class UserSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthForm(
                labelText: 'First Name',
                obscureText: false,
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Last Name',
                obscureText: false,
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Middle Name (Optional)',
                obscureText: false,
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Age',
                obscureText: false,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Gender',
                obscureText: false,
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Phone Number',
                obscureText: false,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Email',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Password',
                obscureText: true,
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Confirm Password',
                obscureText: true,
              ),
              SizedBox(height: 20),
              // Next button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddressSignUpPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent[700],
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              // Already have an account? Login text
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  'Already have an account? Login',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthForm extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextInputType? keyboardType;

  const AuthForm({
    Key? key,
    required this.labelText,
    required this.obscureText,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8), // Adjust spacing between label and text field
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: 'Enter your $labelText', // Hint text for the field
          ),
          obscureText: obscureText,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
