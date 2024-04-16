import 'dart:ui';

import 'package:flutter/material.dart';
import '../pages/rating_page.dart';

class CivicForm extends StatelessWidget {
  final Function onSubmit;

  const CivicForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20), // Adjust radius as needed
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2), // Adjust opacity as needed
          borderRadius: BorderRadius.circular(20), // Same radius as ClipRRect
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Adjust sigmaX and sigmaY for blur intensity
          child: Form(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20), // Add padding for spacing
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Your Complaint',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
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
                        onSubmit(); // Call _handleSubmit function passed from CivicFormView
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
        ),
      ),
    );
  }

  void _handleSubmit(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RatingPage()),
    ).then((value) {
      if (value == 'edit_complaint') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Complaint edited successfully!'),
          duration: Duration(seconds: 2),
        ));
      }
    });
  }

  void _showDialog(BuildContext context, String title, String content) {
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
