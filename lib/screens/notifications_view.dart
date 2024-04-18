import 'package:flutter/material.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/glass_title.dart';

class NotificationsView extends StatefulWidget {
  @override
  _NotificationsViewState createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  int _currentIndex = 2;
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Material(
      // Match parent size
      type: MaterialType.transparency,
      child: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                // Adjust path to your image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Glassmorphic title serving like an app bar
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: GlassTitle(
                  title: 'NOTIFICATIONS'), // Use the GlassTitle widget
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 80.0),
              // Your content widgets go here
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCategoryButton('All'),
                      _buildCategoryButton('Unread'),
                      _buildCategoryButton('Read'),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Notification Cards
                  _buildNotificationCard(),
                  _buildNotificationCard(),
                  _buildNotificationCard(),
                  // Add more notification cards as needed
                ],
              ),
            ),
          ),
          // Bottom navigation bar
          Positioned(
            left: 20,
            right: 20,
            bottom: 20, // Adjust bottom position as needed
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
      ),
    );
  }

  Widget _buildCategoryButton(String category) {
    return Container(
      padding: EdgeInsets.only(bottom: 8), // Add space below
      child: TextButton(
        onPressed: () {
          setState(() {
            _selectedCategory = category;
          });
        },
        style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith((states) {
            return Colors.transparent;
          }),
          textStyle: MaterialStateProperty.resolveWith((states) {
            return TextStyle(
              color: _selectedCategory == category ? Colors.white : Colors.grey,
              fontWeight: _selectedCategory == category
                  ? FontWeight.bold
                  : FontWeight.normal,
              decoration: _selectedCategory == category ? TextDecoration
                  .underline : TextDecoration.none,
            );
          }),
        ),
        child: Text(
          category,
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
      ),
    );
  }


  Widget _buildNotificationCard() {
    return Card(
      color: Colors.white.withOpacity(0.4), // Glass effect color
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          // Add your avatar or icon here
        ),
        title: Text('Notification Title'),
        subtitle: Text('Notification Message'),
        trailing: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            setState(() {
              // Remove the notification from the list or update its status
              // For example, if you have a list of notifications, you can remove the current notification from the list
              // notifications.remove(currentNotification);
            });
          },
        ),
        onTap: () {
          // Handle notification tap
        },
      ),
    );
  }
}
