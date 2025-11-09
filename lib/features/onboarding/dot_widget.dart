import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({super.key,required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 500),
      curve: Curves.easeInOut,
      height: 10.h,
      width:isActive ? 20.w : 10.w,
      margin: REdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color:isActive?ColorsManager.blue: ColorsManager.white,
      ),
    );
  }
}
