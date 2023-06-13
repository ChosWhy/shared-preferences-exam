import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  const IconAndText(
      {Key? key,
      required this.icon,
      required this.text,
      this.iconSize,
      this.iconColor,
      this.textStyle,
      this.betweenIconAndTextPadding,
      this.iconLeftPadding})
      : super(key: key);
  final IconData icon;
  final String text;
  final double? iconSize;
  final Color? iconColor;
  final TextStyle? textStyle;
  final EdgeInsets? betweenIconAndTextPadding;
  final EdgeInsets? iconLeftPadding;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: iconLeftPadding ?? EdgeInsets.zero,
          child: Icon(
            icon,
            size: iconSize ?? 30,
            color: iconColor ?? Colors.black,
          ),
        ),
        Padding(
          padding: betweenIconAndTextPadding ?? const EdgeInsets.only(left: 15),
          child: Text(
            text,
            style: textStyle ??
                Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
