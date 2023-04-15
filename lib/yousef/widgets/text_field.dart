import 'package:flutter/material.dart';

import '../constant/colors.dart';


class TextFieldWidget extends StatelessWidget {
  final String? hintText, label, errorText;
  final TextInputType type;
  final bool password;
  final bool exp, expanded;
  Color activeBorderColor, borderColor, backgroundColor;
  Color ?labelColor;
  bool floatingHint;
  int? maxLines;
  int? minLines;
  Widget? prefixIcon, suffixIcon, suffixWidget;
  TextEditingController? controller;
  InputDecoration? inputDecoration;
  ValueChanged<String>? onChanged;
  TextAlignVertical? textAlignVertical;
  bool? enable;

  TextFieldWidget(
      {required this.onChanged,
        this.password = false,
        this.exp = false,
        this.expanded = false,
        this.floatingHint = true,
        this.type = TextInputType.text,
        this.hintText = "Mobile Number",
        this.label,
        this.errorText,
        this.labelColor,
        this.textAlignVertical,
        this.controller,
        this.activeBorderColor = Colors.white,
        this.borderColor = Colors.white,
        this.backgroundColor = Colors.white,
        this.maxLines = 1,
        this.minLines = 1,
        this.prefixIcon,
        this.suffixIcon,
        this.suffixWidget,
        this.inputDecoration,
        this.enable,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: textAlignVertical,
      controller: controller,
      // inputFormatters: exp ? [CardExpirationFormatter()] : [],
      maxLines: maxLines,
      minLines: minLines,
      autofocus: !floatingHint,
      expands: expanded,
      enabled: enable ?? true,
      decoration: inputDecoration ??
          InputDecoration(
              filled: true,
              fillColor: backgroundColor,
              prefixIcon: prefixIcon,
              suffix: suffixWidget,
              suffixIcon: suffixIcon,
              errorText: errorText,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: activeBorderColor, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(8.0))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(6.0))),
              hintText: floatingHint ? "" : hintText,
              labelStyle:  TextStyle(color:labelColor??blackColor),
              hintStyle: const TextStyle(color: mainColor),
              labelText: floatingHint ? label : ""),
      keyboardType: type,
      obscureText: password,
      onChanged: onChanged,
    );
  }
}
