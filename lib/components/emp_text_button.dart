import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTxtBtn extends StatelessWidget {
  final String title;
  void Function()? onTap;
  final Color color, titleColor;
  CustomTxtBtn({
    super.key,
    required this.title,
    required this.onTap,
    required this.color,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: titleColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
        ),
      ),
    );
  }
}
