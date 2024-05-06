import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

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

            // Timeline Tiles
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.1,
              isFirst: true,
              indicatorStyle: const IndicatorStyle(
                width: 20,
                color: Colors.green,
              ),
              beforeLineStyle: const LineStyle(
                color: Colors.grey,
              ),
              endChild: const _RightChild(
                title: 'Arrived at destination',
                message: 'Your item has arrived at the destination!',
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.1,
              indicatorStyle: const IndicatorStyle(
                width: 20,
                color: Colors.blue,
              ),
              beforeLineStyle: const LineStyle(
                color: Colors.grey,
              ),
              endChild: const _RightChild(
                title: 'On the way',
                message: 'Your item is on the way to the destination.',
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.1,
              indicatorStyle: const IndicatorStyle(
                width: 20,
                color: Colors.yellow,
              ),
              beforeLineStyle: const LineStyle(
                color: Colors.grey,
              ),
              endChild: const _RightChild(
                title: 'Packing',
                message: 'Your item is being packed.',
              ),
            ),
            TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.1,
              isLast: true,
              indicatorStyle: const IndicatorStyle(
                width: 20,
                color: Colors.red,
              ),
              beforeLineStyle: const LineStyle(
                color: Colors.grey,
              ),
              endChild: const _RightChild(
                title: 'Order placed',
                message: 'Your order has been placed.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RightChild extends StatelessWidget {
  const _RightChild({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
