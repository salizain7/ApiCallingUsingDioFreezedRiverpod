
import 'package:firstflutter/src/utils/app_localizations_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrimaryNavigationAppBar extends ConsumerStatefulWidget {
  PrimaryNavigationAppBar(
      {Key? key, required this.globalKey, required this.selectedIndex})
      : super(key: key);

  final GlobalKey<ScaffoldState> globalKey;
  final int selectedIndex;

  bool isSearch = false;
  @override
  PrimaryNavigationAppBarState createState() => PrimaryNavigationAppBarState();
}

class PrimaryNavigationAppBarState
    extends ConsumerState<PrimaryNavigationAppBar> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            bottom: 8.0,
          ),
          child: Row(
            children: <Widget>[

              //const SizedBox(width: 20.0),
              // const Spacer(flex: 1),
              Padding(
                padding: EdgeInsets.only(
                    left: 8.0,
                    right: 8.0),
                child: Text(
                            context.loc.appTitle
                ),
              ),


            ],
          ),
        ),
      ],
    );
  }
}