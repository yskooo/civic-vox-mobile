import 'package:flutter/material.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/glass_title.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Stack(
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
            // Glassmorphic title serving as app bar
            Positioned(
              left: 16,
              right: 16,
              top: 10,
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: GlassTitle(title: 'PROFILE'), // Use the GlassTitle widget
              ),
            ),
            // Content
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 70), // Adjust top padding according to Glassmorphic title height
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  // Your content widgets go here
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Profile info
                      Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1291639667079524352/yUTztc-a_400x400.jpg'), // Adjust path to your profile picture
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Kween Yasmin',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            Text(
                              'email@gmail.com',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to edit profile screen
                              },
                              child: Text('Edit Profile'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      // General text
                      Text(
                        'General',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Card(
                        color: Colors.white.withOpacity(0.3), // Glass effect color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.lock),
                              title: Text('Change Password'),
                              trailing: Icon(Icons.arrow_forward),
                              onTap: () {
                                // Handle change password action
                              },
                            ),
                            Divider(), // Add a divider between list tiles
                            SwitchListTile(
                              title: Text('Dark Mode'),
                              value: true, // Replace with actual dark mode status
                              onChanged: (bool value) {
                                // Toggle dark mode
                              },
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),
                      // Help & Legal text
                      Text(
                        'Help & Legal',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Card(
                        color: Colors.white.withOpacity(0.3), // Glass effect color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.help),
                              title: Text('Help'),
                              onTap: () {
                                // Handle help action
                              },
                            ),
                            SizedBox(height: 10), // Add some space between list tiles
                            ListTile(
                              leading: Icon(Icons.logout),
                              title: Text('Logout'),
                              onTap: () {
                                // Handle logout action
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
        ),
      ),
    );
  }
}
