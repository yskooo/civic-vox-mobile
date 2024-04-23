import 'package:flutter/material.dart';
import 'glass_title.dart';

class GridItem {
  final String label;
  final String? imagePath;

  GridItem(this.label, {this.imagePath});
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
  String? _selectedPurok;
  GridItem? _selectedGridItem;
  bool _showGrid = false;

  void _handleBackButtonPress() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: GlassTitle(
                title: 'YOUR COMPLAINT',
                prefix: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: _handleBackButtonPress,
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: MediaQuery.of(context).padding.top + 60,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xCCCCCC),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Title:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _showGrid = true;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _selectedComplaintType ?? 'Select Type of Complaint',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Icon(Icons.arrow_drop_down, color: Colors.black),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFEFEFEF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(color: Colors.black, width: 1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        if (_showGrid)
                          GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 3,
                            childAspectRatio: 1.5,
                            children: gridItems.map((item) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedGridItem = item;
                                    _selectedComplaintType = item.label;
                                    _showGrid = false;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
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
                                      Text(item.label, style: TextStyle(color: Colors.black)),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        SizedBox(height: 5),
                        Divider(color: Colors.black, thickness: 2),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FormFieldWithTitle(
                              title: 'Add more details about your Complaint',
                              description: 'Details you think are important for us to know',
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFC9C9C9),
                                ),
                                maxLines: 3,
                              ),
                            ),
                            SizedBox(height: 20),
                            FormFieldWithTitle(
                              title: 'Add photos or videos',
                              description: 'Photos and Videos help us to find the best staff and tools for your needs as soon as possible.',
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFC9C9C9),
                                ),
                                maxLines: 3,
                              ),
                            ),
                            SizedBox(height: 20),
                            Divider(color: Colors.black, thickness: 2),
                            FormFieldWithTitle(
                              title: 'Purok Location (Optional)',
                              description: 'Select the location where the issue occurred',
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFC9C9C9),
                                  labelText: 'Purok',
                                ),
                                value: _selectedPurok,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedPurok = newValue;
                                  });
                                },
                                items: [
                                  'Pandel - Purok 1',
                                  'Westland - Dapitilog Purok 2',
                                  'Centro - Purok 3',
                                  'Rillorta - Purok 4',
                                  'Lagtao - Purok 5',
                                  'Magat - Purok 6',
                                  'Highway - Purok 7'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(height: 20),
                            FormFieldWithTitle(
                              title: 'Landmark or Sign of the Area',
                              description: 'Provide any landmark or sign near the location',
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFC9C9C9),
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
                          ],
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmit() {
    widget.onSubmit();
  }
}

class FormFieldWithTitle extends StatelessWidget {
  final String title;
  final String description;
  final Widget child;

  const FormFieldWithTitle({
    required this.title,
    required this.description,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 5),
        Text(
          description,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        SizedBox(height: 10),
        child,
      ],
    );
  }
}
