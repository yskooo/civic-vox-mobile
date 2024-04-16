import 'package:app/screens/community_view.dart';
import 'package:flutter/material.dart';
import 'auth_form.dart';
import 'login_page.dart';
import 'personal_sign_up_page.dart';

class AddressSignUpPage extends StatefulWidget {
  const AddressSignUpPage({Key? key}) : super(key: key);

  @override
  _AddressSignUpPageState createState() => _AddressSignUpPageState();
}

class _AddressSignUpPageState extends State<AddressSignUpPage> {
  String? _selectedPurok; // Store the selected purok value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Content
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            bottom: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFD3DFF6),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Logo at the top of the forms
                          FractionallySizedBox(
                            widthFactor: 0.5,
                            child: Image.asset(
                              'assets/images/civicvoxlogo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          AuthForm(labelText: 'Province', obscureText: false, defaultValue: 'Pangasinan', readOnly: true),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          AuthForm(labelText: 'Municipality', obscureText: false, defaultValue: 'Binmaley', readOnly: true),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          AuthForm(labelText: 'Barangay', obscureText: false, defaultValue: 'Naguilayan', readOnly: true),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Purok',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8),
                              DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: 'Purok',
                                ),
                                value: _selectedPurok,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedPurok = newValue;
                                  });
                                },
                                items: [
                                  'Pandel - Purok 1',
                                  'Westland - Dapitilog Purok 2',
                                  'Centro - Purok 3',
                                  'Rillorta - Purok 4',
                                  'Lagtao - Purok 5',
                                  'Magat - Purok 6',
                                  'Highway - Purok 7'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          AuthForm(labelText: 'Street Name, Building, House Number', obscureText: false),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                          AuthButton(
                            text: 'Sign Up',
                            onPressed: () {
                              // Simulated authentication logic (replace with actual logic)
                              String email = 'user@example.com';
                              String password = 'password';
                              if (true) {
                                // Condition to validate credentials
                                Navigator.pushReplacement(
                                  // Navigate to home page
                                  context,
                                  MaterialPageRoute(builder: (context) => CommunityView()),
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
