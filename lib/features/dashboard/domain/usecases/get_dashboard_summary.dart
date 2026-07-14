import 'package:injectable/injectable.dart';

import '../entities/dashboard_summary.dart';
import '../repositories/dashboard_repository.dart';

/// Use case: fetch the current Dashboard summary for the logged-in user.
@injectable
class GetDashboardSummary {
  const GetDashboardSummary(this._repository);

  final DashboardRepository _repository;

  Future<DashboardSummary?> call() => _repository.getDashboardSummary();
}
