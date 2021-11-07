import 'package:flutter/material.dart';

import '../../../core/theme/ui_helpers.dart';

class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({
    Key? key,
    this.onTap,
    this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
  }) : super(key: key);

  final Widget? icon;
  final String title;
  final String? subtitle;
  final Function()? onTap;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: _themeData.cardColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Color(0xffF1F1F1),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.0, 5.0),
              blurRadius: 20.0,
              color: Colors.black.withOpacity(0.05),
            )
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: padding,
              child: Row(
                crossAxisAlignment: subtitle != null ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                children: [
                  if (icon != null) icon!,
                  if (icon != null) kHorizontalSpaceM,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(title, style: _textTheme.bodyText2),
                        if (subtitle != null) Text(subtitle!, style: _textTheme.subtitle1),
                      ],
                    ),
                  ),
                  kHorizontalSpaceM,
                  if (trailing != null) trailing!,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
