import 'package:flutter/material.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/glass_title.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int _currentIndex = 3;
  bool _isEditingProfile = false; // Track if profile is being edited

  String _username = 'Kween Yasmin'; // Initial username
  String _email = 'email@gmail.com'; // Initial email
  String _phoneNumber = '123-456-7890'; // Initial phone number

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
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: GlassTitle(title: 'PROFILE', prefix: null), // Use the GlassTitle widget without back button
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
                      // Profile info wrapped with GlassContainer
                      GlassContainer(
                        borderRadius: BorderRadius.circular(15),
                        blur: 10,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1291639667079524352/yUTztc-a_400x400.jpg'), // Adjust path to your profile picture
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Kween Yasmin',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                              Text(
                                'email@gmail.com',
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                              SizedBox(height: 10),
                              // "Edit Profile" button
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isEditingProfile = true; // Set editing mode to true
                                  });
                                },
                                child: Text('Edit Profile'),
                              ),
                              SizedBox(height: 20),
                              // Show forms when editing profile
                              if (_isEditingProfile)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    // Form fields for username, email, and phone number
                                    TextFormField(
                                      initialValue: _username,
                                      onChanged: (value) {
                                        _username = value;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Username',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ), // Outline border
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      initialValue: _email,
                                      onChanged: (value) {
                                        _email = value;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ), // Outline border
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      initialValue: _phoneNumber,
                                      onChanged: (value) {
                                        _phoneNumber = value;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Phone Number',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ), // Outline border
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Save changes to profile
                                        setState(() {
                                          _isEditingProfile = false; // Set editing mode to false
                                        });
                                        // Handle saving changes to profile
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(vertical: 12.0), // Adjust padding for button height
                                      ),
                                      child: Text('Save Changes'),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // General text
                      Text(
                        'General',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      // Card wrapped with GlassContainer
                      GlassContainer(
                        borderRadius: BorderRadius.circular(15),
                        blur: 10,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.lock, color: Colors.white),
                                title: Text('Change Password',
                                  style: TextStyle(
                                    color: Colors.black, // Set text color to white
                                  ),
                                ),
                                trailing: Icon(Icons.arrow_forward, color: Colors.white),
                                onTap: () {
                                  // Handle change password action
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Help & Legal text
                      Text(
                        'Help & Legal',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      // Card wrapped with GlassContainer
                      GlassContainer(
                        borderRadius: BorderRadius.circular(15),
                        blur: 10,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.help, color: Colors.white),
                                title: Text(
                                  'Help',
                                  style: TextStyle(
                                    color: Colors.black, // Set text color to white
                                  ),
                                ),
                                onTap: () {
                                  // Handle help action
                                },
                              ),
                              SizedBox(height: 10), // Add some space between list tiles
                              ListTile(
                                leading: Icon(Icons.logout, color: Colors.white),
                                title: Text('Logout',
                                  style: TextStyle(
                                    color: Colors.red, // Set text color to white
                                  ),
                                ),
                                onTap: () {
                                  // Handle logout action
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
      ),
    );
  }
}
