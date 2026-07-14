import 'package:equatable/equatable.dart';

import '../../domain/entities/dashboard_summary.dart';

/// Explicit Dashboard states — no boolean flag soup.
sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [];
}

class DashboardLoading extends DashboardState {
  const DashboardLoading();
}

class DashboardEmpty extends DashboardState {
  const DashboardEmpty();
}

class DashboardLoaded extends DashboardState {
  const DashboardLoaded(this.data);

  final DashboardSummary data;

  @override
  List<Object?> get props => [data];
}

class DashboardError extends DashboardState {
  const DashboardError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
