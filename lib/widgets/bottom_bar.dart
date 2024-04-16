import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  void _onItemTapped(int index) {
    setState(() {
      widget.onTap(index);
    });

    switch (index) {
      case 0:
      // Navigate to Home screen
        Navigator.pushNamed(context, '/community');
        break;
      case 1:
      // Navigate to Complaints screen
        Navigator.pushNamed(context, '/complaints');
        break;
      case 2:
      // Navigate to Notifications screen
        Navigator.pushNamed(context, '/notifications');
        break;
      case 3:
      // Navigate to Profile screen
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: _onItemTapped,
        items: [
          _buildNavigationBarItem(Icons.home, 'Home'),
          _buildNavigationBarItem(Icons.checklist_rounded, 'Complaints'),
          _buildNavigationBarItem(Icons.notifications, 'Notifications'),
          _buildNavigationBarItem(Icons.person, 'Profile'),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Icon(icon),
      ),
      label: label,
    );
  }
}
