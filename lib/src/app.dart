import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firstflutter/src/utils/app_localizations_context.dart';
import 'package:firstflutter/src/utils/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../main.dart';
import 'di/service_locator.dart';
import 'features/home/home_screen.dart';
import 'networks/state/network_info.dart';
class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {

  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    print("app init");

  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    print("app dispose");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print ("app Life cycle changesd");
    switch(state){
      case AppLifecycleState.resumed :
        {
          print ("app resumed");
          //setState(() {
         break;
        }
      case AppLifecycleState.paused:
        {

          print('app paused');
          break;
        }

      case AppLifecycleState.inactive:
        print('app inactive');
        break;
      case AppLifecycleState.detached:
      default:
        print('app detached');
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => NetworkInfoCubit(Connectivity()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

          navigatorKey: getIt<NavigationService>().navigatorKey,
          title: 'Localizations Sample App',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          onGenerateTitle: (context) => context.loc.appTitle,
          locale: const Locale("en"),
          supportedLocales: const [
            Locale('en', ''), // English, no country code

          ],

        onGenerateRoute: (routeSettings) {
          switch (routeSettings.name) {
            case 'home':
              return MaterialPageRoute(
                  builder: (context) =>  const HomeScreen());

            default:
              return MaterialPageRoute(
                  builder: (context) => const HomeScreen());

          }
        },

        initialRoute: 'home'


      ),
    );
  }
}