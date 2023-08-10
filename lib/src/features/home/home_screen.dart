
import 'dart:async';

import 'package:firstflutter/src/features/home/tabScreen1.dart';
import 'package:firstflutter/src/features/home/tabScreen2.dart';
import 'package:firstflutter/src/features/home/tabScreen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../navigations/primary_navigation.dart';


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



  @override
  Widget build(BuildContext context) {


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
