import 'package:flutter/material.dart';

// ignore: always_declare_return_types
void bottomSheet(
  BuildContext context,
  Widget T,
  double height, {
  Function? onSheetCLosed,
}) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: const StadiumBorder(),
    builder: (BuildContext context) {
      return Container(
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: T,
      );
    },
  ).then((value) {
    // ignore: avoid_dynamic_calls
    if (onSheetCLosed != null) onSheetCLosed();
  });
}
