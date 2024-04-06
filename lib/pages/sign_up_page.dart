import 'package:flutter/material.dart';
import '../main.dart';

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
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatelessWidget {
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Last Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Middle Name (Optional)',
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Age',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Gender',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your gender';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Phone Number',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Confirm Password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Additional fields with dropdown
              AuthForm(
                labelText: 'Province',
                initialValue: 'Pangasinan',
                enabled: false,
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Municipality',
                initialValue: 'Binmaley',
                enabled: false,
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Barangay',
                initialValue: 'Naguilyan',
                enabled: false,
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Purok',
                initialValue: '1',
                enabled: true,
                isDropdown: true, // Indicate that it's a dropdown
                dropdownItems: List.generate(7, (index) => (index + 1).toString()), // Generate dropdown items from 1 to 7
                onChanged: (value) {
                  // Add your logic here for when the dropdown value changes
                },
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Street Name, Building, House Number',
              ),
              SizedBox(height: 20),
              // Sign Up button
              ElevatedButton(
                onPressed: () {
                  // Navigate to next page
                  // You can replace SignUpPage() with the desired next page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
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
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool enabled;
  final bool isDropdown; // Indicates whether it's a dropdown field
  final List<String>? dropdownItems; // Items for dropdown
  final void Function(String?)? onChanged;

  const AuthForm({
    Key? key,
    required this.labelText,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.initialValue,
    this.enabled = true,
    this.isDropdown = false,
    this.dropdownItems,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isDropdown
        ? DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      items: dropdownItems!
          .map<DropdownMenuItem<String>>(
            (value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
          .toList(),
      value: initialValue,
      onChanged: onChanged,
      validator: validator,
      onSaved: (value) {}, // Dummy function, replace with actual logic
    )
        : TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      initialValue: initialValue,
      enabled: enabled,
    );
  }
}
