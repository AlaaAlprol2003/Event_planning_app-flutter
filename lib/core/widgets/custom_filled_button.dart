import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.text,
    required this.onpress,
  });
  final String text;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(onPressed: onpress, child: Text(text)),
    );
  }
}
