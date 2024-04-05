import 'package:fademasterz/Utils/app_color.dart';
import 'package:fademasterz/Utils/app_fonts.dart';
import 'package:flutter/material.dart';

class MyAppButton extends StatefulWidget {
  final String? title;
  final EdgeInsets? padding;
  final VoidCallback onPress;
  final double? height;
  final double? width;
  final double? radius;
  final double? fSize;
  final IconData? icon;
  final Border? border;
  final Color? color;

  final TextStyle? style;
  const MyAppButton(
      {super.key,
      this.title,
      this.padding,
      required this.onPress,
      this.height,
      this.width,
      this.fSize,
      this.icon,
      this.color,
      this.style,
      this.radius,
      this.border});

  @override
  State<MyAppButton> createState() => _MyAppButtonState();
}

class _MyAppButtonState extends State<MyAppButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: InkWell(
        onTap: widget.onPress,
        child: Container(
          height: widget.height ?? 58,
          width: widget.width,
          padding: widget.padding ??
              const EdgeInsets.symmetric(
                horizontal: 15,
              ),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColor.yellow,
            ),
            borderRadius: BorderRadius.circular(widget.radius ?? 12),
            color: widget.color ?? AppColor.yellow,
          ),
          child: Center(
            child: Text(widget.title ?? "title",
                style: widget.style ?? AppFonts.blackFont),
          ),
        ),
      ),
    );
  }
}
