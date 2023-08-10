
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';


class NoInternetConnection extends ConsumerStatefulWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  InternetConnectionState createState() => InternetConnectionState();
}

class InternetConnectionState extends ConsumerState<NoInternetConnection> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(

        builder: (_, WidgetRef ref, __){

          return Container(
            //width: double.infinity,
            //height: double.infinity,

            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //const SizedBox(height: 128,),
                  SvgPicture.asset(
                    'assets/icons/live.svg',
                    width: 32,
                    height: 32,
                  ),
                  // Container(
                  //   width: 160,
                  //   height: 160,
                  //   decoration: const BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: AppColors.systemColorWhite,
                  //   ),
                  //   child: const Center(child: Image(image: AssetImage("assets/images/no_internet.png",), width: 64, height: 60,)),
                  // ),
                  const SizedBox(height: 10,),
                  Text('No internet Connection'),
                  const SizedBox(height: 10,),

                  GestureDetector(
                    onTap: (){},
                    child: SvgPicture.asset(
                      'assets/icons/refresh.svg',
                      width: 32,
                      height: 32,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

          );
        },
      ),
    );
  }
}