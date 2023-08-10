import 'package:flutter/material.dart';

class UnSupportedStateWidget extends StatelessWidget {
  final state;

  const UnSupportedStateWidget({Key? key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Unsupported State: ${state.toString()}"),
    );
  }
}
