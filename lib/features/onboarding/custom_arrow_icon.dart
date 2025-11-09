import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomArrowIcon extends StatelessWidget {
  const CustomArrowIcon({super.key, required this.onArrowIconClicked, required this.icon});
  final void Function() onArrowIconClicked;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onArrowIconClicked();
      },
      child: Container(
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: ColorsManager.blue),
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Icon(icon, color: ColorsManager.blue),
      ),
    );
  }
}
