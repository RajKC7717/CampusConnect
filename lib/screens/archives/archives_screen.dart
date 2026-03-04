import 'package:flutter/material.dart';

class ArchivesScreen extends StatelessWidget {
  const ArchivesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF5F7FF),
      body: Center(
        child: Text(
          '📚 Archives — Coming in Chunk 6',
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