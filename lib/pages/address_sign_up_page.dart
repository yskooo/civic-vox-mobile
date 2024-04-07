import 'package:flutter/material.dart';

import '../main.dart';

class AddressSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthForm(
                labelText: 'Province',
                obscureText: false,
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Municipality',
                obscureText: false,
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Barangay',
                obscureText: false,
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Purok',
                obscureText: false,
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Street Name, Building, House Number',
                obscureText: false,
              ),
              SizedBox(height: 20),
              // Submit button
              ElevatedButton(
                onPressed: () {
                  // Navigate to next page or perform action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Proceed',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
