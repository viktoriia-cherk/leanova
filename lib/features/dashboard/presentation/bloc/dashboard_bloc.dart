import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_dashboard_summary.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this._getDashboardSummary) : super(const DashboardLoading()) {
    on<DashboardRequested>(_onDashboardRequested);
    add(const DashboardRequested());
  }

  final GetDashboardSummary _getDashboardSummary;

  Future<void> _onDashboardRequested(
    DashboardRequested event,
    Emitter<DashboardState> emit,
  ) async {
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
