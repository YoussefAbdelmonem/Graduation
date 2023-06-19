
import 'package:flutter/material.dart';
import 'package:meaw/yousef/constant/colors.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required String? Function(String? value) validator,
  required TextInputType inputType,
  required String label,
  IconData? suffix,
  Function()? onSuffixPressed,
  Function()? onTap,
  Function(String s)? onSubmit,
  bool isPassword = false,
  TextCapitalization textCapitalization = TextCapitalization.none,
  required BuildContext context,
}) =>
    Center(
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        obscureText: isPassword,
        onTap: onTap,
        onFieldSubmitted: onSubmit,
        textCapitalization: textCapitalization,
        style: Theme.of(context).textTheme.bodyText1,
        decoration: InputDecoration(
          labelStyle: Theme.of(context).textTheme.bodyText2,
          labelText: label,

          suffixIcon: IconButton(icon: Icon(suffix), onPressed: onSuffixPressed,color: mainColor,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: mainColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: mainColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: mainColor),
          ),
        ),
        validator: validator,
      ),
    );


class AddProductTextField extends StatefulWidget {
  AddProductTextField(
      {Key? key,
        this.controller,
        required this.keyboardType,
        this.label,
        this.hintText,
        this.suffixIcon,
        this.border,
        this.minlines,
        this.maxlines,
        this.height,
        this.onChange,
        required this.validate,
        this.focusNode,
        this.textDirection,
        this.enable})
      : super(key: key);
  bool? enable;
  TextInputType keyboardType;
  Widget? suffixIcon;
  TextEditingController? controller;
  String? label;
  String? hintText;
  double? height;
  String? Function(String?) validate;
  FocusNode? focusNode;
  InputBorder? border;
  int? minlines;
  int? maxlines;
  TextDirection? textDirection;
  Function(String)? onChange;
  @override
  _AddProductTextFieldState createState() => _AddProductTextFieldState();
}

class _AddProductTextFieldState extends State<AddProductTextField> {
  bool? isPass;
  bool? visible;
  @override
  void initState() {
    isPass =
    widget.keyboardType == TextInputType.visiblePassword ? true : false;
    visible = isPass;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Directionality(
        textDirection: widget.textDirection ?? TextDirection.ltr,
        child: TextFormField(
            textDirection: widget.textDirection ?? TextDirection.ltr,
            enabled: widget.enable ?? true,
            onChanged: widget.onChange,
            focusNode: widget.focusNode,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: visible!,
            minLines: widget.minlines,
            maxLines: widget.maxlines ?? 1,
            //  autofocus: false,

            //style: TextStyle(color: mainColor),
            decoration: InputDecoration(
              filled: true,

              fillColor: Colors.white,
              hintStyle: TextStyle(color: Colors.white),

              contentPadding:
              EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              // fillColor: whiteColor70,
              hintText: widget.hintText,
              suffixIcon: widget.suffixIcon ??
                  (isPass!
                      ? IconButton(
                    onPressed: () {
                      setState(() {
                        visible = !visible!;
                      });
                    },
                    icon: Icon(
                      visible! ? Icons.visibility : Icons.visibility_off,
                      // color: Palette.iconColor),
                    ),
                  )
                      : widget.suffixIcon),

              labelText: widget.label,
              border: widget.border ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
              //  border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              // focusedBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.blue),
              //   borderRadius: BorderRadius.all(Radius.circular(35.0)),
              // ),
            ),
            validator: widget.validate),
      ),
    );
  }
}