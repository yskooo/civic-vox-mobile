import 'package:flutter/material.dart';

class CompliancePostCard extends StatelessWidget {
  final String profileImage;
  final String name;
  final String time;
  final String detail;
  final String description;
  final List<String> mediaUrls;
  final int likes;
  final int comments;

  CompliancePostCard({
    required this.profileImage,
    required this.name,
    required this.time,
    required this.detail,
    required this.description,
    required this.mediaUrls,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.3), // Glass effect color
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profileImage),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(time),
                        SizedBox(width: 8), // Add space between time and detail
                        Text(
                          "|",
                          style: TextStyle(fontSize: 16), // Adjust fontSize as needed
                        ),
                        SizedBox(width: 8), // Add space between "|" and detail
                        Text(
                          detail,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            // SizedBox(height: 8),
            Text(description),
            SizedBox(height: 8),
            if (mediaUrls.isNotEmpty)
              Image.network(
                mediaUrls.first,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 8),
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.people),
                    SizedBox(width: 4),
                    Text('+ $likes likes'),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.thumb_up),
                      onPressed: () {
                        // Handle like button press
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.comment),
                      onPressed: () {
                        // Handle comment button press
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
