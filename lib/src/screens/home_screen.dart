
import 'dart:async';

import 'package:firstflutter/src/screens/tabScreen1.dart';
import 'package:firstflutter/src/screens/tabScreen2.dart';
import 'package:firstflutter/src/screens/tabScreen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../navigations/primary_navigation.dart';

var bottomWidgetKey = GlobalKey<State<BottomNavigationBar>>();
bool _initialUriIsHandled = false;
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final List<Widget> _widgetOptions = <Widget>[
    tabScreen1(),
    tabScreen2(),
    tabScreen3()
  ];

  void _onItemTapped(int index) {

    ref.read(selectedIndexState.notifier).update((state) => index);
    // setState(() {
    //   _selectedIndex = index;
    // });
  }


  Uri? _latestUri;
  StreamSubscription? _sub;

  final _scaffoldKey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  // List<String>? getCmds() {
  //   late final String cmd;
  //   var cmdSuffix = '';
  //
  //   const plainPath = 'path/subpath';
  //   const args = 'path/portion/?uid=123&token=abc';
  //   const emojiArgs =
  //       '?arr%5b%5d=123&arr%5b%5d=abc&addr=1%20Nowhere%20Rd&addr=Rand%20City%F0%9F%98%82';
  //
  //   if (kIsWeb) {
  //     return [
  //       plainPath,
  //       args,
  //       emojiArgs,
  //       // Cannot create malformed url, since the browser will ensure it is valid
  //     ];
  //   }
  //
  //   if (Platform.isIOS) {
  //     cmd = '/usr/bin/xcrun simctl openurl booted';
  //   } else if (Platform.isAndroid) {
  //     cmd = '\$ANDROID_HOME/platform-tools/adb shell \'am start'
  //         ' -a android.intent.action.VIEW'
  //         ' -c android.intent.category.BROWSABLE -d';
  //     cmdSuffix = "'";
  //   } else {
  //     return null;
  //   }
  //
  //   // https://orchid-forgery.glitch.me/mobile/redirect/
  //   return [
  //     '$cmd "unilinks://host/$plainPath"$cmdSuffix',
  //     '$cmd "unilinks://example.com/$args"$cmdSuffix',
  //     '$cmd "unilinks://example.com/$emojiArgs"$cmdSuffix',
  //     '$cmd "unilinks://@@malformed.invalid.url/path?"$cmdSuffix',
  //   ];
  // }



  @override
  Widget build(BuildContext context) {



    //ref.watch(selectedSportStateChangesProvider);
    //ref.watch(selectedSportStateChangesProvider);
    //print(getIt<NavigationService>().navigatorKey.currentContext?.loc.loc.oopsSomethingWrong);
    // Future.delayed(const Duration(seconds: 12)).then((value) {
    //   // setState(() {
    //   ref.watch(showWidgetProvider.notifier).update((state) => false);
    //   // });
    // });
    return Scaffold(
      key: _key,
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
          ),
          // child: PrimaryNavigationAppBar(globalKey: _key, selectedIndex: _selectedIndex),
          child: PrimaryNavigationAppBar(globalKey: _key, selectedIndex: ref.watch(selectedIndexState)),

          ),
        ),

      body: Container(
        color: Colors.white70,//Theme.of(context).backgroundColor,
        child: Center(
          child: _widgetOptions.elementAt(ref.watch(selectedIndexState)),
        ),
      ),

      bottomNavigationBar:  BottomNavigationBar(
        key: bottomWidgetKey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).backgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/all_games.svg',
              color: Colors.blueGrey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/all_games.svg',
              color: Colors.blueAccent,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/leagues.svg',
              color: Colors.blueGrey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/leagues.svg',
              color: Colors.blueAccent,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/live.svg',
              color: Colors.blueGrey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/live.svg',
              color: Colors.blueAccent,
            ),
            label: '',
          ),
        ],
        currentIndex: ref.watch(selectedIndexState),
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.blueGrey,
        onTap: _onItemTapped,
      )
    );
  }
}

final selectedIndexState = StateProvider<int>((ref) {
  return 1;
});
