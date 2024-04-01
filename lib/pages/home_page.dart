import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showForm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Placeholder for search functionality
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
      ),
      drawer: Drawer(
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
                // Placeholder for reporting issues feature
                Navigator.pop(context); // Close the drawer
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Report an Issue'),
                      content: Text('Placeholder for reporting issues feature'),
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
            ),
            ListTile(
              title: Text('Government Resources'),
              onTap: () {
                // Placeholder for accessing government resources feature
                Navigator.pop(context); // Close the drawer
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Government Resources'),
                      content: Text('Placeholder for accessing government resources feature'),
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
            ),
            ListTile(
              title: Text('Civic Matters'),
              onTap: () {
                // Placeholder for getting updates on civic matters feature
                Navigator.pop(context); // Close the drawer
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Civic Matters'),
                      content: Text('Placeholder for getting updates on civic matters feature'),
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
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: _showForm ? _buildForm() : _buildWelcomeMessage(),
          ),
        ),
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
    return Form(
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
            width: double.infinity, // Set width to match other forms
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
                backgroundColor: MaterialStateProperty.all(Colors.blue), // Change the color of the button
                foregroundColor: MaterialStateProperty.all(Colors.white), // Change the text color
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15, horizontal: 20)), // Adjust padding for increased height
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt_outlined, size: 30), // Increase the size of the icon
                  SizedBox(width: 10), // Adjust the space between the icon and text
                  Text(
                    'Upload Photo or Video',
                    style: TextStyle(fontSize: 18), // Increase the font size of the text
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
                // Placeholder for submitting complaint
                _handleSubmit();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  void _handleSubmit() {
    // Placeholder for handling form submission
    // Reset the form visibility after submission
    setState(() {
      _showForm = false;

    });
  }
}
