import 'package:auto_route/auto_route.dart';
import 'package:employee_management/emp_utils/emp_colors_utils.dart';
import 'package:employee_management/emp_utils/emp_if_else_util.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredHeight = 56;
  final void Function()? onTap;
  List<Widget>? actions;
  final String title;
  String? buttonTitle;
  PreferredSizeWidget? bottom;
  bool? showLeading;
  Widget? customLeading;
  Color? backgroundColor;
  TextStyle? titleStyle;
  TextAlign? textAlign;
  bool? showSubTitle;
  String? subTitle;
  CustomAppBar({
    super.key,
    this.buttonTitle,
    required this.title,
    this.onTap,
    this.actions,
    this.bottom,
    this.showLeading = true,
    this.customLeading,
    this.backgroundColor,
    this.titleStyle,
    this.textAlign,
    this.showSubTitle = false,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? EmpColors.primary,
      elevation: 0,
      centerTitle: false,
      // automaticallyImplyLeading: true,
      leadingWidth: showLeading == false ? 0 : 80,
      leading: Conditional.ifelse(
        showLeading == false,
        valid: SizedBox(),
        invalid: customLeading ??
            InkWell(
              onTap: () {
                AutoRouter.of(context).pop();
              },
              child: Icon(
                Icons.keyboard_arrow_left,
                size: 30,
                color: EmpColors.secondary,
              ),
            ),
      ),
      bottom: bottom,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            // textAlign: textAlign,
            style: titleStyle ??
                Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: EmpColors.secondary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
          ),
          if (showSubTitle == true)
            Text(
              subTitle!,
              textAlign: textAlign,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: EmpColors.secondary, fontSize: 16),
            ),
        ],
      ),
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}
