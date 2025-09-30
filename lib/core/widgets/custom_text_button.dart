import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.title,
    required this.onPressed, this.decoration, this.fontStyle,
  });
  final String title;
  final VoidCallback onPressed;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: ColorsManager.blue,
          fontStyle: fontStyle,
          decoration: decoration,
          decorationColor: ColorsManager.blue,
          decorationThickness: 2,
        ),
      ),
    );
  }
}
