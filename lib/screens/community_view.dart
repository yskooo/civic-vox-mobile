import 'package:flutter/material.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/civic_form.dart';
import '../widgets/glass_title.dart';
import '../widgets/post.dart'; // Import the CompliancePostCard widget

class CommunityView extends StatefulWidget {
  @override
  _CommunityViewState createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {
  int _currentIndex = 0;
  bool _showForm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          // Glassmorphic title serving as app bar
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: GlassTitle(
                title: 'COMMUNITY',
              ),
            ),
          ),
          // Content
          Positioned(
            top: 70, // Adjust top position based on the title height
            bottom: _showForm ? 0 : 16,
            // Adjust bottom position based on whether the form is shown
            left: 0,
            right: 0,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                CompliancePostCard(
                  profileImage: 'profile_image_url',
                  name: 'John Doe',
                  time: '2 hours ago',
                  detail: 'Compliance Details',
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  mediaUrls: ['https://cdn.autokid.com.ph/wp-content/uploads/2021/06/Truck-Trailers-and-Their-Uses-1080x675.jpg'], // Provide media URLs here
                  likes: 10,
                  comments: 5,
                ),
                // Add more CompliancePostCard widgets as needed
              ],
            ),
          ),
          // Civic form
          if (_showForm)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _showForm = false; // Hide the form when tapped outside
                  });
                },
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  alignment: Alignment.center,
                  child: CivicForm(
                    onSubmit: () {
                      setState(() {
                        _showForm = false;
                      });
                    },
                  ),
                ),
              ),
            ),
          // Floating action button
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.15, // Adjust position based on screen height
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _showForm = true; // Set _showForm to true when button is clicked
                });
              },
              backgroundColor: Colors.blue, // Set background color to blue
              child: Icon(Icons.edit, color: Colors.white), // Set icon color to white
              shape: CircleBorder(), // Set shape to circular
              heroTag: null, // Set hero tag to null to prevent duplicate hero tag errors
              elevation: 5, // Add elevation for a shadow effect
              mini: false, // Make the button normal size
            ),
          ),
          // Bottom navigation bar
          if (!_showForm) // Render bottom bar only if the form is not active
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
}
