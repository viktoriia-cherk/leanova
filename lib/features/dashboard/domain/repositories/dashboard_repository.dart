import '../entities/dashboard_summary.dart';

/// Domain-level contract for retrieving the Dashboard summary. Implemented
/// by the data layer; presentation depends only on this interface.
abstract class DashboardRepository {
  Future<DashboardSummary?> getDashboardSummary();
}
