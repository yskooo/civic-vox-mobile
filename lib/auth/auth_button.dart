import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AuthButton({
    Key? key,
    required this.text,
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
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}