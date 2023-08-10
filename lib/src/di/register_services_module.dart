
import 'package:dio/dio.dart';
import 'package:firstflutter/src/di/service_locator.dart';
import 'package:injectable/injectable.dart';

import '../features/home/data/data_sources/tab_remote_source.dart';
import '../features/home/data/repositories/tab_repository.dart';
import '../networks/dio_client.dart';
import '../networks/interceptors/tab_interceptor.dart';
import '../networks/tab_api_client.dart';
import '../utils/navigation_service.dart';

@module
abstract class RegisterServicesModule{

  @lazySingleton
  DioClient get dioClient => DioClient();

  @lazySingleton
  TabApiClient get tabApiClient => TabApiClient(dioClient.getDioClient(getIt<TabInterceptor>()), baseUrl: DioClient.baseUrl);

  @lazySingleton
  NavigationService get navigationService => NavigationService();

  TabRepositoryImp get tabRepositoryImp => TabRepositoryImp(getIt<TabApiProvider>());
}