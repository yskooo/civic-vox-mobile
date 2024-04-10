import 'package:app/pages/address_sign_up_page.dart';
import 'package:flutter/material.dart';
import 'auth_form.dart';
import 'personal_sign_up_page.dart';

class PersonalSignUpPage extends StatelessWidget {
  const PersonalSignUpPage({Key? key}) : super(key: key);

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
                          AuthForm(labelText: 'First Name', obscureText: false),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          AuthForm(labelText: 'Middle Name (Optional)', obscureText: false),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          AuthForm(labelText: 'Last Name', obscureText: false),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          AuthForm(labelText: 'Date of Birth', obscureText: false),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          AuthForm(labelText: 'Gender', obscureText: false),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          AuthForm(labelText: 'Contact Number', obscureText: false),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                          NextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  AddressSignUpPage()),
                              );
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
        minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
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
