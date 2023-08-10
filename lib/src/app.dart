import 'package:firstflutter/main.dart';
import 'package:firstflutter/src/core/router/app_router.dart';
import 'package:firstflutter/src/core/styles/app_theme.dart';
import 'package:firstflutter/src/core/translations/l10n.dart';
import 'package:firstflutter/src/features/authentication/presentation/pages/login_page.dart';
import 'package:firstflutter/src/shared/domain/entities/enums/connectivity_status_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shared/domain/entities/enums/theme_mode_enum.dart';
import 'shared/domain/providers/connectivity/connectivity_provider.dart';
import 'shared/domain/providers/theme/theme_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'shared/presentation/pages/no_route_defined_page.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print("app init");
  }

  @override
  Widget build(BuildContext context) {


    // Theme provider
    final themMode = ref.watch(themeModeProvider);

    return Consumer(
      builder: (context, ref, child) {
        // Connectivity provider
        ConnectivityStatusEnum connectivityStatusProvider =
        ref.watch(connectivityStatusProviders);
        // Handle connectivity here


        return ScreenUtilInit(
          useInheritedMediaQuery: true,
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              theme: themMode == ThemeModeEnum.dark ? darkAppTheme : lightAppTheme,
              debugShowCheckedModeBanner: false,
              navigatorKey: navigatorKey,
              title: 'Localizations Sample App',
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              onGenerateTitle: (context) {
                return S.of(context).appTitle;
              },
              locale: const Locale("en"),
              supportedLocales: const [
                Locale("ar"),
                Locale("en"),
              ],
              onGenerateRoute: AppRouter.generateRoute,
              home: child,
            );
          },
          child: connectivityStatusProvider == ConnectivityStatusEnum.isDisconnected
              ? const LoginPage()
              : const NoRouteDefinedPage(),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print("app dispose");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("app Life cycle changesd");
    switch (state) {
      case AppLifecycleState.resumed:
        {
          print("app resumed");
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
}
