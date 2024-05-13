import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

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
    widget.onTap(index);

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/community');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/complaints');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/notifications');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.09;
    final labelStyle = TextStyle(fontSize: 6,);

    return Container(
      width: screenWidth,
      child: GlassContainer(
        height: 70,
        borderRadius: BorderRadius.circular(20),
        blur: 10,
        border: Border.all(color: Colors.white.withOpacity(0.7), width: 1.7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBarItem(Icons.home, 'Community', 0, iconSize, labelStyle),
            _buildBarItem(Icons.checklist_rounded, 'Complaints', 1, iconSize, labelStyle),
            _buildBarItem(Icons.notifications, 'Notifications', 2, iconSize, labelStyle),
            _buildBarItem(Icons.person, 'Profile', 3, iconSize, labelStyle),
          ],
        ),
      ),
    );
  }

  Widget _buildBarItem(IconData icon, String label, int index, double iconSize, TextStyle labelStyle) {
    final isSelected = index == widget.currentIndex;
    final color = isSelected ? Colors.black : Colors.black;
    final backgroundColor = isSelected ? Colors.white.withOpacity(0.9) : Colors.transparent;

    return Expanded(
      child: InkWell(
        onTap: () => _onItemTapped(index), // Call _onItemTapped with index when tapped
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: iconSize, color: color),
              SizedBox(height: 4),
              Text(label, style: labelStyle.copyWith(color: color)),
            ],
          ),
        ),
      ),
    );
  }
}
