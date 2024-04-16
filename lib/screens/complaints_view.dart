import 'package:flutter/material.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/civic_form.dart';
import '../widgets/glass_title.dart';

class ComplaintsView extends StatefulWidget {
  @override
  _ComplaintsViewState createState() => _ComplaintsViewState();
}

class _ComplaintsViewState extends State<ComplaintsView> {
  int _currentIndex = 1;
  bool _showForm = false; // Initially set to false

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
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Glassmorphic title
          const Positioned(
            left: 16,
            right: 16,
            top: 10,
            child: GlassTitle(title: 'COMPLAINTS'),
          ),
          // Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              // Your content widgets go here
            ),
          ),
          // Civic form
          if (_showForm)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _showForm = false;
                  });
                },
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  alignment: Alignment.center,
                  child: CivicForm(
                    onSubmit: () {
                      // Handle form submission
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
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
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
