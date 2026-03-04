import 'package:flutter/material.dart';

class RoommateScreen extends StatelessWidget {
  const RoommateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF5F7FF),
      body: Center(
        child: Text(
          '🏠 Roommate Matchmaker — Coming in Chunk 4',
          style: TextStyle(
            fontFamily: 'DM Sans',
            fontSize: 18,
            color: Color(0xFF6B7280),
          ),
        ),
      ),
    );
  }
}