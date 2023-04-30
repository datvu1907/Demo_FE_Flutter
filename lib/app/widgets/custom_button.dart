import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/app_colors.dart';
import 'dart:typed_data';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final double? height;
  final double? width;
  double? fontSize;
  Color? textColor;
  Color? color;
  Color? borderColor;
  bool enable;
  BorderRadius? borderRadius;
  FontWeight? fontWeight;
  Color ctaBg;
  ValueChanged<String>? onChanged;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  CustomTextButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.width,
      this.height,
      this.enable = true,
      this.color,
      this.ctaBg = AppColors.ctaColor,
      this.borderColor,
      this.fontSize,
      this.textColor,
      this.borderRadius,
      this.fontWeight,
      this.onChanged,
      this.padding,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => enable ? onPressed.call() : null,
        child: Container(
            height: height ?? height,
            width: width ?? width,
            margin: margin ?? const EdgeInsets.all(0),
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: borderRadius ?? BorderRadius.circular(25),
                color: color ?? Colors.transparent,
                border: Border.all(
                    color: borderColor == null
                        ? AppColors.primaryColor
                        : borderColor!)),
            child: Center(
                child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: fontSize ?? 14,
                fontWeight: fontWeight ?? FontWeight.w600,
                color: textColor ?? AppColors.white,
              ),
            ))));
  }
}
