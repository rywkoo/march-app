import 'package:flutter/material.dart';
import '../helper/style.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleColor.black,
      appBar: AppBar(
        backgroundColor: StyleColor.filledBackground,
        leading: Icon(Icons.menu, color: StyleColor.black),
        title: Text(
          "Notifications",
          style: TextStyle(
            color: StyleColor.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.25),
      ),
      body: const Center(
        child: Text(
          "Notifications Page Body",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
