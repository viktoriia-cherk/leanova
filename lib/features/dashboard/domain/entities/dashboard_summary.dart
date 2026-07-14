import 'package:equatable/equatable.dart';

/// Aggregated snapshot of a user's progress shown on the Dashboard tab.
class DashboardSummary extends Equatable {
  const DashboardSummary({
    required this.currentWeightKg,
    required this.weightChangeKg,
    required this.habitStreakDays,
    required this.todayCaloriesLogged,
    required this.calorieGoal,
  });

  final double currentWeightKg;
  final double weightChangeKg;
  final int habitStreakDays;
  final int todayCaloriesLogged;
  final int calorieGoal;

  @override
  List<Object?> get props => [
    currentWeightKg,
    weightChangeKg,
    habitStreakDays,
    todayCaloriesLogged,
    calorieGoal,
  ];
}
