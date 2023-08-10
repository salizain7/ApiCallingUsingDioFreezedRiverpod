import 'package:firstflutter/src/core/helper/helper.dart';
import 'package:firstflutter/src/shared/presentation/pages/app_drawer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundPage extends StatefulWidget {
  final Widget child;
  final Widget? image;
  final bool withDrawer;
  final Function(String coin)? drawerCallBack;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final ValueNotifier<double>? dyValueNotifier;
  final bool isMoving;
  final bool tradeBackground;
  final bool topSafeArea;
  final bool bottomSafeArea;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool hasBlurBackground;

  const BackgroundPage({
    required this.child,
    this.withDrawer = false,
    this.image,
    this.drawerCallBack,
    this.scaffoldKey,
    this.bottomNavigationBar,
    Key? key,
    this.dyValueNotifier,
    this.isMoving = false,
    this.tradeBackground = false,
    this.topSafeArea = false,
    this.bottomSafeArea = false,
    this.hasBlurBackground = false,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<BackgroundPage> createState() => _BackgroundPageState();
}

class _BackgroundPageState extends State<BackgroundPage> {
  // final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  bool isCallFromDrawer = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          widget.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (widget.hasBlurBackground) ...{
            if (widget.image != null) ...{
              widget.image!,
            }
          },
          Scaffold(
            key: widget.scaffoldKey,
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: true,
            bottomNavigationBar: widget.bottomNavigationBar,
            onDrawerChanged: (isOpened) {
              if (!isOpened) {
                if (!isCallFromDrawer) {
                  if (widget.drawerCallBack != null) {
                    widget.drawerCallBack!("");
                  }
                }
                isCallFromDrawer = false;
              }
            },
            drawer: widget.withDrawer
                ? Drawer(
                    width: ScreenUtil().orientation == Orientation.portrait
                        ? ScreenUtil().screenWidth * 0.75
                        : ScreenUtil().screenHeight * 0.6,
                    child: const AppDrawerPage(),
                  )
                : null,
            body: SafeArea(
              bottom: widget.bottomSafeArea,
              top: widget.topSafeArea,
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
