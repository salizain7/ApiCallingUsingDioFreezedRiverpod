import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firstflutter/src/features/home/presentation/controller/tab_controller.dart';
import 'package:firstflutter/src/features/home/presentation/controller/tab_state.dart';
import 'package:firstflutter/src/utils/app_localizations_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/errors/no_internet_connection.dart';
import '../../networks/state/network_info.dart';

class tabScreen1 extends ConsumerStatefulWidget {
  const tabScreen1({Key? key}) : super(key: key);
  @override
  tabScreenState createState() => tabScreenState();
}

class tabScreenState extends ConsumerState<tabScreen1> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(tabDataScreenControllerProvider);

    ref.listen<TabDataState>(tabDataScreenControllerProvider, (_, state) {
      if (state is! TabDataLoadingState &&
          state is TabDataErrorFetchDataState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.errorMsg.toString())),
        );
      }
      // if (state is TabDataLoadingState || state is TabDataInitialState) {
      //   const Center(
      //     child: CircularProgressIndicator(),
      //   );
      // }

    });

    return BlocBuilder<NetworkInfoCubit, ConnectivityResult>(
        builder: (context, connectivityState) {
          if (isConnected(connectivityState)) {
            return
              state is TabDataLoadingState || state is TabDataInitialState
                  ? const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              )
                  : state is TabDataSuccessFetchDataState
                  ?
              //Expanded(
              // child:
              Container(
                color: Colors.grey,
                child:
                    Text("${ref
                        .watch(tabDataScreenControllerProvider
                        .notifier)
                        .tabData.name}   ${context.loc.explore_search}")
              )
                  : Text(context.loc.errorUndefinedErrorhappened);
          } else {
            return const NoInternetConnection();
          }
        }
        );
  }
}