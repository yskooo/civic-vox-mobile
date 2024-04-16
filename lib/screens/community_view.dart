import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/pages/rating_page.dart';

class CommunityView extends StatefulWidget {
  @override
  _CommunityViewState createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {
  int _currentIndex = 0;
  bool _showForm = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              // Adjust the path to your image
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Glassmorphic title
        Positioned(
          left: 16,
          right: 16,
          top: 10,
          child: _buildGlassTitle('COMMUNITY'),
        ),
        // Content
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            // Your content widgets go here
          ),
        ),
        // Floating action button
        Positioned(
          bottom: _showForm ? 0 : 16,
          // Adjust bottom position based on whether the form is shown
          right: 16,
          child: _showForm
              ? SizedBox() // Return SizedBox if form is shown
              : FloatingActionButton(
            onPressed: () {
              setState(() {
                _showForm = true;
              });
            },
            child: Icon(Icons.add),
          ),
        ),
        // Bottom navigation bar
        Positioned(
          left: 16,
          right: 16,
          bottom: 16, // Adjust bottom position as needed
          child: _buildBottomNavigationBar(),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20), // Clip rounded corners
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3), // Glass effect color
            borderRadius: BorderRadius.circular(20), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ], // Add boxShadow for glass effect
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              _buildNavigationBarItem(Icons.home, 'Home'),
              _buildNavigationBarItem(Icons.group, 'Complaints'),
              _buildNavigationBarItem(Icons.notifications, 'Notifications'),
              _buildNavigationBarItem(Icons.person, 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(
      IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          // color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          // Rounded corners
          // border: Border.all(color: Colors.black, width: 1),
          // Border for selected icon
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ], // Add boxShadow for glass effect
        ),
        child: Icon(icon),
      ),
      label: label,
    );
  }

  Widget _buildGlassTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3), // Glass effect color
        borderRadius: BorderRadius.circular(20), // Rounded corners
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
