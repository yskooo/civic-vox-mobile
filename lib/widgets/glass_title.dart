import 'package:flutter/material.dart';

class GlassTitle extends StatelessWidget {
  final String title;
  final IconButton? prefix;

  const GlassTitle({Key? key, required this.title, this.prefix})
      : super(key: key);

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (prefix != null) prefix!,
          Expanded(
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
          ),
          SizedBox(width: prefix != null ? 48 : 0),
          // Spacer to align title and back button
        ],
      ),
    );
  }
}