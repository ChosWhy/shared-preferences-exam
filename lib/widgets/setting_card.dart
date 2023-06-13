import 'package:flutter/material.dart';
import '../core/icon_and_text_widget.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({
    super.key, this.rightChild, required this.text, required this.icon, this.generalPadding, this.iconColor,
  });
  final Widget? rightChild;
  final String text;
  final IconData icon;
  final EdgeInsets? generalPadding;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: generalPadding ?? const EdgeInsets.only(bottom: 15),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndText(
                iconColor: iconColor,
                icon: icon,
                text: text,
                iconLeftPadding: const EdgeInsets.only(left: 15.0),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: rightChild ?? const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
