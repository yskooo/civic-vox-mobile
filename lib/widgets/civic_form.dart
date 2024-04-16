import 'dart:ui';
import 'package:flutter/material.dart';

class GridItem {
  final String label;
  final String? imagePath; // Make imagePath optional

  GridItem(this.label, {this.imagePath}); // Make imagePath optional parameter
}

final List<GridItem> gridItems = [
  GridItem('Emergency'),
  GridItem('Natural Disaster', imagePath: 'assets/natural_disaster.png'),
  GridItem('Unethical Behavior', imagePath: 'assets/unethical_behavior.png'),
  GridItem('Road', imagePath: 'assets/road.png'),
  GridItem('Animals', imagePath: 'assets/animals.png'),
  GridItem('Electricity', imagePath: 'assets/electricity.png'),
  GridItem('Street Lights', imagePath: 'assets/street_lights.png'),
  GridItem('Waste', imagePath: 'assets/waste.png'),
  GridItem('Vehicles', imagePath: 'assets/vehicles.png'),
  GridItem('Noise Disturbance', imagePath: 'assets/noise_disturbance.png'),
  GridItem('Air Pollution', imagePath: 'assets/air_pollution.png'),
  GridItem('Drainage', imagePath: 'assets/drainage.png'),
  GridItem('Buildings', imagePath: 'assets/buildings.png'),
  GridItem('Others', imagePath: 'assets/others.png'),
];

class CivicForm extends StatefulWidget {
  final Function onSubmit;

  const CivicForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _CivicFormState createState() => _CivicFormState();
}

class _CivicFormState extends State<CivicForm> {
  String? _selectedComplaintType;
  GridItem? _selectedGridItem; // Variable to store the selected grid item
  bool _showGrid = false;
  bool _showForm = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity, // Adjust height as needed
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1), // Adjust opacity for glass effect
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.2)), // Add border for glassmorphism effect
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Add shadow for glass effect
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Raise your Complaint',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  // Button to open grid
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showGrid = true;
                      });
                    },
                    child: Text(
                      _selectedComplaintType ?? 'Type of Complaint',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Grid of 3x5 boxes (only shown when button is tapped)
                  if (_showGrid)
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      childAspectRatio: 1.5,
                      children: gridItems.map((item) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedGridItem = item; // Update the selected grid item
                              _selectedComplaintType = item.label; // Update the selected complaint type
                              _showGrid = false; // Hide the grid after selection
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              border: Border.all(color: Colors.grey.withOpacity(0.2)), // Adjust border opacity for glass effect
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (item.imagePath != null)
                                  Image.asset(
                                    item.imagePath!,
                                    width: 40,
                                    height: 40,
                                  ),
                                SizedBox(height: 8),
                                Text(item.label),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  SizedBox(height: 20),

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
                        backgroundColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.6)), // Adjust opacity for glass effect
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        ),
                      ),
                      child: Column(
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
        ),
      ),
    );
  }

  void _handleSubmit() {
    widget.onSubmit(); // Call onSubmit function passed from CivicFormView
  }
}
