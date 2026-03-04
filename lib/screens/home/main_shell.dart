import 'package:flutter/material.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CampusConnect')),
      body: const Center(
        child: Text('Home — Main Shell', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}