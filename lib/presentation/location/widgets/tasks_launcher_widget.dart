import 'package:at_onboarding_flutter/services/size_config.dart';
import 'package:atsign_location_app/shared/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tasks extends StatelessWidget {
  const Tasks({
    Key? key,
    required this.task,
    // required this.icon,
    required this.onTap,
    required this.path,
    this.angle = 0.0,
    this.color,
    this.size,
  }) : super(key: key);
  // final IconData icon;
  final String task;
  final Function onTap;
  final double angle;
  final String path;
  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return InkWell(
      onTap: onTap as void Function()?,
      child: SizedBox(
        height: 54.toHeight,
        width: 70.toWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Transform.rotate(
              angle: angle,
              child: SvgPicture.asset(
                path,
                color: color ?? Theme.of(context).primaryColor,
                width: size ?? 24,
                height: size ?? 24,
                semanticsLabel: '',
              ),
              // Icon(
              //   icon,
              //   size: 20.toWidth,
              //   color: AllColors().ORANGE,
              // ),
            ),
            Flexible(
              child: Text(
                task,
                style: CustomTextStyles().black12,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
