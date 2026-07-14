import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_dashboard_summary.dart';
import 'dashboard_state.dart';

@injectable
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(this._getDashboardSummary) : super(const DashboardLoading()) {
    loadDashboard();
  }

  final GetDashboardSummary _getDashboardSummary;

  Future<void> loadDashboard() async {
    emit(const DashboardLoading());
    try {
      final summary = await _getDashboardSummary();
      if (summary == null) {
        emit(const DashboardEmpty());
      } else {
        emit(DashboardLoaded(summary));
      }
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }
}
