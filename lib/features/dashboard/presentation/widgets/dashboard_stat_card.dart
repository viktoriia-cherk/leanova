import 'package:flutter/material.dart';

import '../../../../shared/widgets/app_card.dart';

/// A single stat tile (e.g. weight, streak, calories) shown in a grid on the
/// Dashboard page. Built on the shared [AppCard] component.
class DashboardStatCard extends StatelessWidget {
  const DashboardStatCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      leadingIcon: icon,
      title: value,
      subtitle: label,
    );
  }
}
