import 'package:flutter/material.dart';

class BrolxScreen extends StatelessWidget {
  const BrolxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF5F7FF),
      body: Center(
        child: Text(
          '🛒 BroLX Marketplace — Coming in Chunk 5',
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