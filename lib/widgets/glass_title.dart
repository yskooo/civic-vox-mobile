import 'package:flutter/material.dart';

class GlassTitle extends StatelessWidget {
  final String title;

  const GlassTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3), // Glass effect color
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), // Rounded corners for bottom left
          bottomRight: Radius.circular(20), // Rounded corners for bottom right
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
