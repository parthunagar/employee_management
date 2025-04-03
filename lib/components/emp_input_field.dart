import 'package:employee_management/emp_utils/emp_colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class EmpInputTextField extends StatefulWidget {
  bool isObsecure = false;
  bool userInteraction = true;
  String hintText = "";
  String fieldName = "";
  int length = 0;
  TextEditingController? controller;
  TextInputType? inputType;
  void Function()? onTap;
  Widget? prefixIcon;
  int? maxLines;
  double? applyHeight;
  bool? enableInteractiveSelection;
  int? minLines;
  bool? showLableField;
  List<TextInputFormatter>? inputFormatters;
  Widget? suffix,suffixIcon;
  bool? readOnly;
  bool? showMendatoryStar;
  Color? fillColor;
  FloatingLabelBehavior? floatingLabelBehavior;
  String? label;
  FocusNode? unitCodeCtrlFocusNode;
  int? maxLength;
  EdgeInsetsGeometry? contentPadding;
  // bool? enabled;
  bool? autofocus;
  void Function(String)? onChange;
  TextInputAction? textInputAction;
  EmpInputTextField({
    super.key,
    this.isObsecure = false,
    this.userInteraction = true,
    this.hintText = '',
    this.fieldName = '',
    this.controller,
    this.inputType,
    this.length = 0,
    this.onTap,
    this.maxLines,
    this.applyHeight,
    this.inputFormatters,
    this.enableInteractiveSelection = true,
    this.minLines,
    this.showLableField = true,
    this.suffix,
    this.suffixIcon,
    this.readOnly = false,
    this.showMendatoryStar,
    this.fillColor,
    this.floatingLabelBehavior,
    this.label,
    this.unitCodeCtrlFocusNode,
    this.onChange,
    this.maxLength,
    this.autofocus,
    this.contentPadding,
    this.prefixIcon,
    this.textInputAction,
    // this.enabled,
  });

  @override
  EmpInputTextFieldState createState() => EmpInputTextFieldState();
}

class EmpInputTextFieldState extends State<EmpInputTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.applyHeight ?? 40,
      child: TextField(
        maxLength: widget.maxLength,
        // autofocus: widget.autofocus ?? false,
        obscureText: widget.isObsecure,
        focusNode: widget.unitCodeCtrlFocusNode,
        controller: widget.controller,
        keyboardType: widget.inputType,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: EmpColors.blackShade,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
        readOnly: widget.readOnly ?? false,
        enabled: widget.userInteraction,
        onTap: widget.onTap ?? () {},
        maxLines: widget.maxLines ?? 1,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        minLines: 1, //widget.minLines,
        //s
        textInputAction: widget.textInputAction,
        inputFormatters: widget.inputFormatters,
        onChanged: widget.onChange ?? (val) {},
        expands: false,
        decoration: InputDecoration(
          counterText: "",
          alignLabelWithHint: true,
          floatingLabelBehavior:
              widget.floatingLabelBehavior ?? FloatingLabelBehavior.never,
          labelText: widget.label ?? widget.hintText,
          labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: EmpColors.dark,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
          suffix: widget.suffix,
          suffixIcon: widget.suffixIcon,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 14, right: 8),
            child: widget.prefixIcon,
          ),
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 70, maxWidth: 70),
          contentPadding: widget.contentPadding ??
              const EdgeInsets.only(top: 15, bottom: 0, left: 10, right: 10),
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: EmpColors.dark,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
          filled: true,
          fillColor: widget.fillColor ?? EmpColors.secondary,
          // border: border,
          // focusedErrorBorder: border,
          // errorBorder: border,
          // focusedBorder: border,
          // disabledBorder: border,
          // enabledBorder: border,
        ),
      ),
    );
  }
}
