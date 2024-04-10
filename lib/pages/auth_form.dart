import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final double fieldHeight;
  final double labelTextSize;
  final double hintTextSize;
  final double inputTextSize;
  final double borderRadius;
  final String? defaultValue;
  final bool readOnly; // New parameter for making the text field non-editable

  const AuthForm({
    Key? key,
    required this.labelText,
    required this.obscureText,
    this.fieldHeight = 50.0,
    this.labelTextSize = 16.0,
    this.hintTextSize = 14.0,
    this.inputTextSize = 18.0,
    this.borderRadius = 10.0,
    this.defaultValue,
    this.readOnly = false, // Default to editable text field
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: defaultValue);

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
            controller: controller,
            readOnly: readOnly, // Set the readOnly property based on the parameter
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
