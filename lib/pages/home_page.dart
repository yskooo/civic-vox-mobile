import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/pages/rating_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool _showForm = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'), // Adjust the path to your image
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Glassmorphic title
        Positioned(
          left: 16,
          right: 16,
          top: -30,
          child: _buildGlassTitle('COMMUNITY'),
        ),
        // Content
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: _showForm ? _buildForm() : SizedBox(), // Return SizedBox if you don't want to display anything
            ),
          ),
        ),
        // Floating action button
        Positioned(
          bottom: _showForm ? 0 : 16, // Adjust bottom position based on whether the form is shown
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
          left: 0,
          right: 0,
          bottom: -80,
          child: _buildBottomNavigationBar(),
        ),
      ],
    );
  }




  Container _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3), // Glass effect color
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), // Clip rounded corners
        child: Stack(
          children: [
            // Background container to make the Stack fill the space
            Positioned.fill(
              child: Container(
                color: Colors.transparent, // Make container transparent
              ),
            ),
            // Bottom navigation bar container
            Positioned(
              left: 0,
              right: 0,
              bottom: 20, // Adjust bottom position as needed
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Adjust padding as needed
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8), // Adjust opacity for glass effect
                  borderRadius: BorderRadius.circular(30),
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
          ],
        ),
      ),
    );
  }



  BottomNavigationBarItem _buildNavigationBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.transparent, // Set the color to transparent
          borderRadius: BorderRadius.circular(20), // Rounded corners
          border: Border.all(color: Colors.black, width: 1), // Border for selected icon
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
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3), // Glass effect color
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      child: Center( // Center the text
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'), // Path to your background image
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Adjust sigmaX and sigmaY for blur intensity
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Your Complaint',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Type of Community Problem',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    value: 'option1',
                    child: Text('Option 1'),
                  ),
                  DropdownMenuItem(
                    value: 'option2',
                    child: Text('Option 2'),
                  ),
                  DropdownMenuItem(
                    value: 'option3',
                    child: Text('Option 3'),
                  ),
                ],
                onChanged: (value) {},
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    // Placeholder for uploading photo or video from local storage
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt_outlined, size: 50),
                      SizedBox(width: 10),
                      Text(
                        'Upload Photo or Video',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Write Your Problem',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Purok Location (Optional)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    value: 'purok1',
                    child: Text('Purok 1'),
                  ),
                  DropdownMenuItem(
                    value: 'purok2',
                    child: Text('Purok 2'),
                  ),
                  DropdownMenuItem(
                    value: 'purok3',
                    child: Text('Purok 3'),
                  ),
                ],
                onChanged: (value) {},
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Landmark or Sign of the Area',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Placeholder for tapping to record mic sound
                },
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.mic),
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _handleSubmit();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSubmit() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RatingPage()),
    ).then((value) {
      if (value == 'edit_complaint') {
        setState(() {
          _showForm = true;
        });
      }
    });
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
