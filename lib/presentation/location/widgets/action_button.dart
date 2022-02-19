import 'package:atsign_location_app/presentation/location/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class ArriveActionButton extends StatelessWidget {
  const ArriveActionButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.iconColor,
    this.containerWidth,
    this.containerHeight,
    this.alignment,
    this.padding,
    this.iconSize,
  }) : super(key: key);
  final Widget icon;
  final Color? iconColor;
  final double? iconSize, containerWidth, containerHeight;
  final EdgeInsets? padding;
  final MainAxisAlignment? alignment;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ArrivePrimaryButton(
      prefixIcon: icon,
      borderRadius: BorderRadius.zero,
      color: Colors.transparent,
      alignment: alignment ?? MainAxisAlignment.center,
      containerWidth: containerWidth ?? 40,
      containerHeight: containerHeight ?? 40,
      iconColor: iconColor ?? Theme.of(context).primaryColor,
      iconSize: iconSize ?? 21,
      padding: padding ?? const EdgeInsets.all(5),
      onPressed: onPressed,
    );
  }
}
