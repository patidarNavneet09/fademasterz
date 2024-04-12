import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*class MyTextField extends StatefulWidget {
  TextEditingController controller;
  final TextInputAction? action;
  int? maxLines;
  int? minLines;
  String? hintText;
  TextStyle? hintTextStyle;
  TextStyle? style;
  Image? prefixIcon;
  Image? suffixIcon;
  bool? filled;
  final BorderRadius? radius;

  final BorderSide? side;
  Color? color;
  MyTextField(
      {super.key,
      required this.controller,
      this.action,
      this.hintText,
      this.maxLines,
      this.minLines,
      this.style,
      this.radius,
      this.suffixIcon,
      this.prefixIcon,
      this.filled,
      this.hintTextStyle,
      this.color,
      this.side});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textInputAction: widget.action ?? TextInputAction.done,
      style: widget.style ?? AppFonts.regular,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText ?? 'Enter',
        hintStyle: widget.hintTextStyle ?? AppFonts.text2,
        filled: widget.filled ?? true,
        fillColor: widget.color ?? AppColor.black,
        border: OutlineInputBorder(
          borderRadius: widget.radius ?? BorderRadius.circular(16),
          borderSide: widget.side ??
              BorderSide(
                width: 1,
                color: Theme.of(context).hoverColor,
              ),
        ),
      ),
    );
  }
}*/

class MyTextField {
  static Widget myTextFormField({
    String? title,
    bool? is_border,
    required TextEditingController controller,
    FocusNode? focusNode,
    required TextInputType textInputType,
    required TextInputAction textInputAction,
    GestureTapCallback? onTap,
    TextStyle? hintTextStyle,
    BorderRadius? radius,
    required String hintText,
    final BorderSide? borderSide,
    bool? obscureText,
    Color? fillColor,
    Widget? prefixIcon,
    Widget? suffixIcon,
    int? maxLength,
    int? maxLines,
  }) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please fill password';
        }
      },
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      focusNode: focusNode,
      obscureText: false,
      keyboardType: textInputType,
      style: AppFonts.textFieldFont,
      textInputAction: textInputAction,
      cursorColor: AppColor.yellow,
      decoration: InputDecoration(
          filled: true,
          fillColor: fillColor ?? AppColor.black,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: radius ?? BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: radius ??
                BorderRadius.circular(
                  16,
                ),
            borderSide: borderSide ?? BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: hintTextStyle ?? AppFonts.textFieldHint),
      onTap: onTap,
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String? title;
  final bool? readonly;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final GestureTapCallback? onTap;
  final TextStyle? hintTextStyle;
  final TextStyle? style;
  final double? radius;
  final BorderSide? borderSide;
  final String hintText;
  final bool? obscureText;
  final bool? validator;
  final bool? isFilled;
  final bool? enabled;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextField({
    super.key,
    this.title,
    required this.controller,
    required this.hintText,
    this.textInputType,
    this.textInputAction,
    this.focusNode,
    this.onTap,
    this.hintTextStyle,
    this.radius,
    this.obscureText,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.maxLines,
    this.isFilled = true,
    this.borderSide,
    this.style,
    this.enabled,
    this.inputFormatters,
    this.validator,
    this.readonly,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please fill field';
        }
      },
      readOnly: readonly ?? false,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      keyboardType: textInputType,
      style: style ?? AppFonts.textFieldFont,
      textInputAction: textInputAction,
      cursorColor: AppColor.yellow,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        filled: isFilled,
        fillColor: fillColor ?? AppColor.black,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        counterText: '',
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(radius ?? 16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            radius ?? 16,
          ),
          borderSide: borderSide ?? BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: hintTextStyle ?? AppFonts.textFieldHint,
      ),
      onTap: onTap,
    );
  }
}
