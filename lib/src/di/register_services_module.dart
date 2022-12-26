
import 'package:dio/dio.dart';
import 'package:firstflutter/src/di/service_locator.dart';
import 'package:injectable/injectable.dart';

import '../networks/dio_client.dart';
import '../networks/interceptors/tab_interceptor.dart';
import '../networks/tab_api_client.dart';
import '../screens/data/data_sources/tab_remote_source.dart';
import '../screens/data/repositories/tab_repository.dart';
import '../utils/navigation_service.dart';

@module
abstract class RegisterServicesModule{
  //
  // @preResolve
  // Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  //@lazySingleton
  //Future<SharedPreferencesStorage> get prefsStorage async => SharedPreferencesStorage(await prefs);
  @lazySingleton
  DioClient get dioClient => DioClient();
  // @lazySingleton
  // Dio get dio => DioClient.instance.getDioClient(getIt<TysonInterceptor>());
  // @lazySingleton
  // AuthApiClient get apiClient => AuthApiClient(dioClient.getDioClient(getIt<AuthInterceptor>()), baseUrl: '${DioClient.baseUrl}${DioClient.authApiPath}');
  // @lazySingleton
  // TysonApiClient get tysonApiClient => TysonApiClient(dioClient.getDioClient(getIt<TysonInterceptor>()), baseUrl: '${DioClient.tysonBaseUrl}${DioClient.liveAnimationApiPath}');
  // @lazySingleton
  // SportsApiClient get sportsApiClient => SportsApiClient(dioClient.getDioClient(getIt<SportsInterceptor>()), baseUrl: DioClient.sportsBaseUrl);
  @lazySingleton
  TabApiClient get tabApiClient => TabApiClient(dioClient.getDioClient(getIt<TabInterceptor>()), baseUrl: DioClient.baseUrl);
  // @lazySingleton
  // UserApiClient get userApiClient => UserApiClient(dioClient.getDioClient(getIt<UserInterceptor>()),baseUrl: DioClient.sportsUsersBaseUrl);
  // @lazySingleton
  // http.Client get client => http.Client();
  // @lazySingleton
  // Utils get utils => Utils();
  @lazySingleton
  NavigationService get navigationService => NavigationService();
  //@lazySingleton
  //WebSocketClient get webSocketClient => WebSocketClient((event) => (){});
  //@singleton
  //AuthApiProvider get authApiProvider => AuthApiProvider(apiClient);
  // @lazySingleton
  // Ref get ref => Ref<MatchesApiProvider>();

  // @injectable
  // AuthRepositoryImp get authRepositoryImp => AuthRepositoryImp(getIt<AuthLocalProvider>(), getIt<AuthApiProvider>());
  // MatchesRepositoryImp get matchesRepositoryImp => MatchesRepositoryImp(getIt<MatchesApiProvider>(), getIt<MatchLiveAnimationApiProvider>(),getIt<MatchesNotifier>(),getIt<MatchNotifier>());
  // LeaguesRepositoryImp get leaguesRepositoryImp => LeaguesRepositoryImp(getIt<LeaguesApiProvider>(), getIt<SharedPreferencesStorage>(), getIt<LeaguesNotifier>());
  // SportsRepositoryImp get sportsRepositoryImp => SportsRepositoryImp(getIt<SportsApiProvider>(), getIt<SportsLocalProvider>());
  // UsersRepositoryImp get usersRepositoryImp => UsersRepositoryImp(getIt<UsersLocalProvider>(), getIt<UsersFirebaseProvider>(), getIt<UsersApiProvider>());
  // SearchesRepositoryImp get searchesRepositoryImp => SearchesRepositoryImp(getIt<SearchesApiProvider>());
  // NavigationDrawerRepositoryImp get navigationDrawerRepositoryImp => NavigationDrawerRepositoryImp(getIt<NavigationDrawerLocalProvider>());
  TabRepositoryImp get tabRepositoryImp => TabRepositoryImp(getIt<TabApiProvider>());
  // FavoritesRepositoryImp get favoritesRepositoryImp => FavoritesRepositoryImp(getIt<FavoritesApiProvider>(),getIt<FavoritesNotifier>());
  // PlayersRepositoryImp get playersRepositoryImp => PlayersRepositoryImp(getIt<PlayersApiProvider>());
  // TeamsRepositoryImp get teamsRepositoryImp => TeamsRepositoryImp(getIt<TeamsApiProvider>());
  // FifaRankingsRepositoryImp get fifaRankingsRepositoryImp => FifaRankingsRepositoryImp(getIt<FifaRankingApiProvider>());
}