import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelTitle,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.isObscure = false
  });
  final String labelTitle;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final bool isObscure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:isObscure ,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        labelText: labelTitle,
      ),
    );
  }
}
