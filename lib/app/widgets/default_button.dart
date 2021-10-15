import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.decoration,
    this.color,
    this.onTap,
    required this.label,
    this.highlightColor,
    this.splashColor,
    this.padding,
  }) : super(key: key);

  final BoxDecoration? decoration;
  final Color? color;
  final Widget label;
  final VoidCallback? onTap;
  final Color? splashColor;
  final Color? highlightColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        height: 44.0,
        color: color,
        decoration: decoration,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            splashColor: splashColor,
            highlightColor: highlightColor,
            child: Container(
              padding: padding,
              alignment: Alignment.center,
              child: label,
            ),
          ),
        ),
      ),
    );
  }
}
