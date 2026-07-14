// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:leanova/features/dashboard/data/datasources/dashboard_local_data_source.dart'
    as _i92;
import 'package:leanova/features/dashboard/data/repositories/dashboard_repository_impl.dart'
    as _i1041;
import 'package:leanova/features/dashboard/domain/repositories/dashboard_repository.dart'
    as _i643;
import 'package:leanova/features/dashboard/domain/usecases/get_dashboard_summary.dart'
    as _i20;
import 'package:leanova/features/dashboard/presentation/bloc/dashboard_bloc.dart'
    as _i384;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i92.DashboardLocalDataSource>(
      () => _i92.DashboardLocalDataSource(),
    );
    gh.lazySingleton<_i643.DashboardRepository>(
      () => _i1041.DashboardRepositoryImpl(gh<_i92.DashboardLocalDataSource>()),
    );
    gh.factory<_i20.GetDashboardSummary>(
      () => _i20.GetDashboardSummary(gh<_i643.DashboardRepository>()),
    );
    gh.factory<_i384.DashboardBloc>(
      () => _i384.DashboardBloc(gh<_i20.GetDashboardSummary>()),
    );
    return this;
  }
}
