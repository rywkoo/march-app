import 'package:flutter/material.dart';
import '../helper/style.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleColor.black,
      appBar: AppBar(
        backgroundColor: StyleColor.filledBackground,
        leading: Icon(Icons.menu, color: StyleColor.black),
        title: Text(
          "Settings",
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
          "Settings Page Body",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
