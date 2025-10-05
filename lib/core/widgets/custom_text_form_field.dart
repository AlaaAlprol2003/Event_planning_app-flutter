import 'package:flutter/material.dart';

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
