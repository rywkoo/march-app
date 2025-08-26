import 'package:flutter/material.dart';
import '../helper/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int qty = 0;

  void increase() {
    setState(() {
      qty++;
    });
  }

  void decrease() {
    setState(() {
      if (qty > 0) qty--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleColor.black,
      appBar: AppBar(
        backgroundColor: StyleColor.filledBackground,
        leading: Icon(Icons.menu, color: StyleColor.black),
        title: Text(
          'Home',
          style: TextStyle(
            color: StyleColor.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Quantity Control
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Decrease Button
              GestureDetector(
                onTap: decrease,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: StyleColor.filledBackground.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(Icons.remove, color: StyleColor.black),
                ),
              ),
              const SizedBox(width: 16),

              // Quantity Display
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color: StyleColor.filledBackground,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  "$qty",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: StyleColor.black,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // Increase Button
              GestureDetector(
                onTap: increase,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: StyleColor.filledBackground.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(Icons.add, color: StyleColor.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
