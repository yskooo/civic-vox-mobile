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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Check your email',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'We sent a reset link to contact@dscode...com enter 5 digit code that mentioned in the email',
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 20),
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
              text: 'Verify Code',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Haven’t got the email yet? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12, // Adjust font size
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Implement resend email functionality here
                  },
                  child: Text(
                    'Resend Email',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12, // Adjust font size
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, // Remove padding
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}