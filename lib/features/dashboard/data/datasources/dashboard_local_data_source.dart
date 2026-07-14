import 'package:injectable/injectable.dart';

@lazySingleton
class DashboardLocalDataSource {
  Future<DashboardSummaryDto?> getDashboardSummary() async {
    return null;
  }
}

class DashboardSummaryDto {
  const DashboardSummaryDto({
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
}
