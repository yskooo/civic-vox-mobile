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
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: Stack(
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
          // Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: _showForm ? _buildForm() : _buildWelcomeMessage(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _showForm
          ? null
          : FloatingActionButton(
        onPressed: () {
          setState(() {
            _showForm = true;
          });
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Community'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Search'),
                  content: Text('Placeholder for search functionality'),
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
          },
          icon: Icon(Icons.search),
        ),
      ],
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Report an Issue'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Placeholder for reporting issues feature
              _showDialog('Report an Issue',
                  'Placeholder for reporting issues feature');
            },
          ),
          ListTile(
            title: Text('Government Resources'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Placeholder for accessing government resources feature
              _showDialog('Government Resources',
                  'Placeholder for accessing government resources feature');
            },
          ),
          ListTile(
            title: Text('Civic Matters'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Placeholder for getting updates on civic matters feature
              _showDialog('Civic Matters',
                  'Placeholder for getting updates on civic matters feature');
            },
          ),
        ],
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.blue),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group, color: Colors.blue),
          label: 'Complaints',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications, color: Colors.blue),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.blue),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.blue,
    );
  }

  Widget _buildWelcomeMessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Welcome to the Citizen App!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
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
