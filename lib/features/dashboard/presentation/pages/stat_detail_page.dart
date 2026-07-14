import 'package:flutter/material.dart';

/// Placeholder detail screen a dashboard stat card navigates to.
/// Will be replaced with the real per-stat detail/history view.
class StatDetailPage extends StatelessWidget {
  const StatDetailPage({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(label)),
      body: Center(
        child: Text(
          '$label details coming soon',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
