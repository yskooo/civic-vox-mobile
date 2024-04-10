import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final double fieldHeight;
  final double labelTextSize;
  final double hintTextSize;
  final double inputTextSize;
  final double borderRadius;

  const AuthForm({
    Key? key,
    required this.labelText,
    required this.obscureText,
    this.fieldHeight = 50.0,
    this.labelTextSize = 16.0,
    this.hintTextSize = 14.0,
    this.inputTextSize = 18.0,
    this.borderRadius = 10.0,
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
            fontSize: labelTextSize,
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: fieldHeight,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              hintText: 'Enter your $labelText',
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              hintStyle: TextStyle(fontSize: hintTextSize),
            ),
            obscureText: obscureText,
            style: TextStyle(fontSize: inputTextSize),
          ),
        ),
      ],
    );
  }
}
