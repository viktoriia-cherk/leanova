import 'package:injectable/injectable.dart';

import '../../domain/entities/dashboard_summary.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_local_data_source.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(this._localDataSource);

  final DashboardLocalDataSource _localDataSource;

  @override
  Future<DashboardSummary?> getDashboardSummary() async {
    final dto = await _localDataSource.getDashboardSummary();
    if (dto == null) return null;
    return DashboardSummary(
      currentWeightKg: dto.currentWeightKg,
      weightChangeKg: dto.weightChangeKg,
      habitStreakDays: dto.habitStreakDays,
      todayCaloriesLogged: dto.todayCaloriesLogged,
      calorieGoal: dto.calorieGoal,
    );
  }
}
