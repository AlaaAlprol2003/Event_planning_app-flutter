import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelTitle,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.isObscure = false,
    required this.validator,
    required this.controller
  });
  final String labelTitle;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final bool isObscure;
  final String? Function(String?) validator;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText:isObscure ,
      obscuringCharacter: "*",
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        labelText: labelTitle,
      ),
    );
  }
}
