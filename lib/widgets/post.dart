import 'package:flutter/material.dart';

class CompliancePostCard extends StatelessWidget {
  final String profileImage;
  final String name;
  final String time;
  final String detail;
  final String description;
  final int likes;
  final int comments;

  const CompliancePostCard({
    Key? key,
    required this.profileImage,
    required this.name,
    required this.time,
    required this.detail,
    required this.description,
    required this.likes,
    required this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.3), // Glass effect color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profileImage),
                  radius: 20.0,
                ),
                SizedBox(width: 10.0),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    ]),
                  ],
                ),
            SizedBox(height: 10.0),
            Text(description),
            SizedBox(height: 10.0),
            Row(
              children: [
                Icon(Icons.thumb_up),
                SizedBox(width: 5.0),
                Text(likes.toString()),
                SizedBox(width: 20.0),
                Icon(Icons.comment),
                SizedBox(width: 5.0),
                Text(comments.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
