import 'package:at_onboarding_flutter/services/size_config.dart';
import 'package:atsign_location_app/shared/common_components/iconly_icon.dart';
import 'package:atsign_location_app/shared/common_components/icons_curved.dart';
import 'package:atsign_location_app/shared/text_styles.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconlyIcon(
          path: IconlyCurved.DangerSquare,
          size: 35,
          color: Theme.of(context).primaryColor,
        ),
        // SizedBox(
        //   height: 15.toHeight,
        // ),
        Text(title, style: CustomTextStyles().grey16),
        SizedBox(
          height: 5.toHeight,
        ),
      ],
    );
  }
}
