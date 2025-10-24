import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
     this.labelTitle,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.isObscure = false,
    required this.validator,
    required this.controller,
    this.hintText,
    this.hintStyle, this.lines = 1
  });
  final String? labelTitle;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final bool isObscure;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final int lines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      style: GoogleFonts.inter(fontSize: 16.sp,fontWeight: FontWeight.w500,color: ColorsManager.blue),
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText:isObscure ,
      obscuringCharacter: "*",
      keyboardType: keyboardType,
      maxLines: lines,
      decoration: InputDecoration(
        
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle:hintStyle ,
        labelText: labelTitle,
      ),
    );
  }
}
