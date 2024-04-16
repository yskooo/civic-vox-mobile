import 'package:app/pages/get_started.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/screens/community_view.dart';
import 'package:app/screens/complaints_view.dart';
import 'package:app/screens/notifications_view.dart';
import 'package:app/screens/profile_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CIVIC VOX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/complaints': (context) => ComplaintsView(),
        '/community': (context) => CommunityView(),
        '/notifications': (context) => NotificationsView(),
        '/profile': (context) => ProfileView(),
      },

      home: const GetStartedPage(),
    );
  }
}
