import 'package:flutter/material.dart';

/// Placeholder Lessons tab. 
class LessonsPage extends StatelessWidget {
  const LessonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lessons')),
      body: const SafeArea(
        child: Center(child: Text('Lessons coming soon')),
      ),
    );
  }
}
