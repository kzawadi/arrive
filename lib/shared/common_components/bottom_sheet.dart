import 'package:flutter/material.dart';

// ignore: always_declare_return_types
void bottomSheet(
  BuildContext context,
  Widget T,
  double height, {
  Function? onSheetCLosed,
}) async {
  var future = showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: StadiumBorder(),
    builder: (BuildContext context) {
      return Container(
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: T,
      );
    },
  );

  // ignore: unawaited_futures
  future.then((value) {
    if (onSheetCLosed != null) onSheetCLosed();
  });
}
