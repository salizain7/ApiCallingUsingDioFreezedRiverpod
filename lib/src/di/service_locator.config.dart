// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../networks/dio_client.dart' as _i3;
import '../networks/interceptors/tab_interceptor.dart' as _i7;
import '../networks/tab_api_client.dart' as _i5;
import '../features/home/presentation/controller/tab_controller.dart' as _i9;
import '../features/home/data/data_sources/tab_remote_source.dart' as _i6;
import '../features/home/data/repositories/tab_repository.dart' as _i8;
import '../utils/navigation_service.dart' as _i4;
import 'register_services_module.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
    _i1.GetIt get, {
      String? environment,
      _i2.EnvironmentFilter? environmentFilter,
    }) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerServicesModule = _$RegisterServicesModule();
  gh.lazySingleton<_i3.DioClient>(() => registerServicesModule.dioClient);
  gh.lazySingleton<_i4.NavigationService>(
      () => registerServicesModule.navigationService);
  gh.lazySingleton<_i5.TabApiClient>(() => registerServicesModule.tabApiClient);
  gh.factory<_i6.TabApiProvider>(
      () => _i6.TabApiProvider(get<_i5.TabApiClient>()));
  gh.lazySingleton<_i7.TabInterceptor>(() => _i7.TabInterceptor());
  gh.factory<_i8.TabRepository>(
      () => _i8.TabRepositoryImp(get<_i6.TabApiProvider>()));
  gh.factory<_i8.TabRepositoryImp>(
      () => registerServicesModule.tabRepositoryImp);
  gh.factory<_i9.TabDataScreenController>(() =>
      _i9.TabDataScreenController(tabRepository: get<_i8.TabRepository>()));
  return get;
}

class _$RegisterServicesModule extends _i10.RegisterServicesModule {}
