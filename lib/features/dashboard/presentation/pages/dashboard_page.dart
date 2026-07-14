import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/app_primary_button.dart';
import '../../domain/entities/dashboard_summary.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_event.dart';
import '../bloc/dashboard_state.dart';
import '../widgets/dashboard_stat_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DashboardBloc>(),
      child: const _DashboardView(),
    );
  }
}

const mockDashboardSummary = DashboardSummary(
  currentWeightKg: 78.5,
  weightChangeKg: -1.8,
  habitStreakDays: 12,
  todayCaloriesLogged: 1450,
  calorieGoal: 2200,
);

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: SafeArea(
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) => switch (state) {
            DashboardLoading() => const _LoadingView(),
            DashboardError(:final message) => _ErrorView(message: message),
            DashboardEmpty() => const _ContentView(data:mockDashboardSummary),
            DashboardLoaded(:final data) => _ContentView(data: data),
          },
        ),
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: [
        const SizedBox(height: AppSpacing.xxl),
        Icon(
          Icons.insights_outlined,
          size: 56,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          'No data yet',
          style: theme.textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Log your first weigh-in or meal to see your progress here.',
          style: theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.xl),
        AppPrimaryButton(
          label: 'Get started',
          onPressed: () => context.read<DashboardBloc>().add(const DashboardRequested()),
        ),
      ],
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: [
        const SizedBox(height: AppSpacing.xxl),
        Icon(
          Icons.error_outline,
          size: 56,
          color: theme.colorScheme.error,
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          'Something went wrong',
          style: theme.textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(message, style: theme.textTheme.bodyMedium, textAlign: TextAlign.center),
        const SizedBox(height: AppSpacing.xl),
        AppPrimaryButton(
          label: 'Try again',
          onPressed: () => context.read<DashboardBloc>().add(const DashboardRequested()),
        ),
      ],
    );
  }
}

class _ContentView extends StatelessWidget {
  const _ContentView({required this.data});

  final DashboardSummary data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RefreshIndicator(
      onRefresh: () async =>
          context.read<DashboardBloc>().add(const DashboardRequested()),
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text('Welcome back', style: theme.textTheme.headlineMedium),
          const SizedBox(height: AppSpacing.lg),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: AppSpacing.md,
            crossAxisSpacing: AppSpacing.md,
            childAspectRatio: 1.4,
            children: [
              DashboardStatCard(
                icon: Icons.monitor_weight_outlined,
                label: 'Current weight',
                value: '${data.currentWeightKg.toStringAsFixed(1)} kg',
              ),
              DashboardStatCard(
                icon: Icons.trending_down,
                label: 'Change',
                value: '${data.weightChangeKg.toStringAsFixed(1)} kg',
              ),
              DashboardStatCard(
                icon: Icons.local_fire_department_outlined,
                label: 'Habit streak',
                value: '${data.habitStreakDays} days',
              ),
              DashboardStatCard(
                icon: Icons.restaurant_outlined,
                label: 'Calories today',
                value: '${data.todayCaloriesLogged}/${data.calorieGoal}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
