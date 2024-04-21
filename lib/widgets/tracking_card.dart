import 'package:flutter/material.dart';

class TrackingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // "In Progress" Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.circle_rounded, color: Colors.blue), // Icon in blue color
                        SizedBox(width: 8),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'In Progress',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue), // Text in blue color
                              ),
                              Text('Ticket #10'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.red, // Placeholder color
                          // Your picture widget here
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Road (Broken Road) at Purok #2',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'We need help to fix this road right now, it causes traffic. We’re gonna be late. charot',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16), // Add some space between "In Progress" Card and the vertical stepper

            // Divider or SizedBox for tracking
            SizedBox(height: 16),
            Divider(color: Colors.grey), // Use Divider widget for visual separation
            SizedBox(height: 16),
            Divider(color: Colors.grey), // Add more dividers as needed for spacing
            SizedBox(height: 16),
            Divider(color: Colors.grey),

          ],
        ),
      ),
    );
  }
}
