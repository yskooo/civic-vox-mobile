import 'package:flutter/material.dart';
import 'auth_form.dart';
import 'address_sign_up_page.dart'; // corrected import
import 'personal_sign_up_page.dart';

class PersonalSignUpPage extends StatelessWidget {
  const PersonalSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg-auth.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Logo at the top
        Positioned(
          top: MediaQuery.of(context).size.height * 0.05,
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
        // Forms Container
        Positioned.fill(
          top: MediaQuery.of(context).size.height * 0.3, // Adjust the top position
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: SingleChildScrollView(
              child: Material( // Wrap with Material widget
                color: Color(0xFFD3DFF6),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
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
                            MaterialPageRoute(builder: (context) => AddressSignUpPage()),
                          );
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).viewInsets.bottom), // Adjust for keyboard
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
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
