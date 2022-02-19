import 'package:at_onboarding_flutter/services/size_config.dart';
import 'package:atsign_location_app/shared/colors.dart';
import 'package:flutter/material.dart';

class CollapsedContentWidget extends StatelessWidget {
  const CollapsedContentWidget({
    Key? key,
    required this.slidingScrollController,
    required this.isExpanded,
    required this.child,
  }) : super(key: key);

  final bool isExpanded;
  final ScrollController slidingScrollController;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      key: key,
      height: !isExpanded ? 260.toHeight : 530.toHeight,
      padding: EdgeInsets.fromLTRB(15.toWidth, 7.toHeight, 0, 0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: AllColors().DARK_GREY,
            blurRadius: 10,
            spreadRadius: 1,
            // offset: const Offset(0.0, 0.0),
          )
        ],
      ),
      child: child,
    );
  }
}
