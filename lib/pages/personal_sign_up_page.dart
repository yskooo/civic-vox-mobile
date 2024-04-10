import 'package:app/pages/user_sign_up_page.dart';
import 'package:flutter/material.dart';
import 'address_sign_up_page.dart';
import 'auth_form.dart';

class PersonalSignUpPage extends StatelessWidget {
  const PersonalSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
            // Content
            Positioned.fill(
              bottom: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      color: Color(0xFFD3DFF6),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          AuthForm(
                            labelText: 'First Name',
                            obscureText: false,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          AuthForm(
                            labelText: 'Middle Name (Optional)',
                            obscureText: false,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          AuthForm(
                            labelText: 'Last Name',
                            obscureText: false,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          AuthForm(
                            labelText: 'Date of Birth',
                            obscureText: false,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          AuthForm(
                            labelText: 'Gender',
                            obscureText: false,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          AuthForm(
                            labelText: 'Contact Number',
                            obscureText: false,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                          NextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddressSignUpPage()),
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
          ],
        ),
      ),
    );
  }
}
