import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/glass_title.dart';

class NotificationsView extends StatefulWidget {
  @override
  _NotificationsViewState createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'), // Adjust path to your image
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Glassmorphic title
        Positioned(
          left: 16,
          right: 16,
          top: 10,
          child: GlassTitle(title: 'PROFILE'), // Use the GlassTitle widget
        ),
        // Content
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            // Your content widgets go here
            child: Column(
              children: [
                // Add your profile content widgets here
                // For example:
                Text('Notifications'),
              ],
            ),
          ),
        ),
        // Bottom navigation bar
        Positioned(
          left: 0,
          right: 0,
          bottom: 0, // Align to the bottom of the screen
          child: BottomBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ],
    );
  }
}
