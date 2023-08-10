import 'package:firstflutter/main.dart';
import 'package:firstflutter/src/core/router/app_router.dart';
import 'package:firstflutter/src/core/styles/app_theme.dart';
import 'package:firstflutter/src/core/translations/l10n.dart';
import 'package:firstflutter/src/shared/domain/entities/enums/connectivity_status_enum.dart';
import 'package:firstflutter/src/shared/domain/entities/enums/theme_mode_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shared/domain/providers/connectivity/connectivity_provider.dart';
import 'shared/domain/providers/theme/theme_provider.dart';

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
    // Connectivity provider
    ConnectivityStatusEnum connectivityStatusProvider =
        ref.watch(connectivityStatusProviders);
    // Handle connectivity here

    // Theme provider
    final themMode = ref.watch(themeModeProvider);

    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
            theme:
                themMode == ThemeModeEnum.dark ? darkAppTheme : lightAppTheme,
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            title: 'Localizations Sample App',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
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
