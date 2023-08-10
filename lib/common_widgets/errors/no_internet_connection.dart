
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

                  const SizedBox(height: 10,),
                  const Text('No internet Connection'),
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