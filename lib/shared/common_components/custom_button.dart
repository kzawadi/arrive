import 'package:at_onboarding_flutter/services/size_config.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.child,
    this.height = 50,
    required this.onTap,
    this.padding,
    this.width = 50,
    required this.bgColor,
    this.radius,
    this.border,
  }) : super(key: key);

  final double? width, height, radius;
  final EdgeInsets? padding;
  final Widget child;
  final void Function() onTap;
  final Color bgColor;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width!.toWidth,
        height: height!.toHeight,
        // ignore: use_named_constants
        padding: padding ?? const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: bgColor,
          border: border ?? const Border(),
          borderRadius: BorderRadius.circular(radius ?? 30),
        ),
        child: child,
      ),
    );
  }
}
