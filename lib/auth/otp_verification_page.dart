import 'package:app/auth/auth_button.dart';
import 'package:app/auth/password_confirmation_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({Key? key}) : super(key: key);

  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final TextEditingController _otpController = TextEditingController();
  bool _isCorrectOTP = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter the OTP sent to your email address.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                5,
                    (index) => SizedBox(
                  width: 50,
                  child: TextFormField(
                    controller: _otpController,
                    onChanged: (value) {
                      if (value.length == 5) {
                        // Simulated OTP validation (replace with actual validation)
                        if (value == '12345') {
                          setState(() {
                            _isCorrectOTP = true;
                          });
                        }
                      } else {
                        setState(() {
                          _isCorrectOTP = false;
                        });
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    textAlign: TextAlign.center,
                    maxLength: 1,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            AuthButton(
              onPressed: () {
                // if (_isCorrectOTP) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PasswordResetPage()),
                );
                // } e
              },
              text: 'Verify OTP',
            ),
          ],
        ),
      ),
    );
  }
}