import 'package:flutter/material.dart';

/// Placeholder Profile tab.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const SafeArea(
        child: Center(child: Text('Profile coming soon')),
      ),
    );
  }
}
