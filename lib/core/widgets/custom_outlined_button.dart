import 'package:evently_app/core/resources/colors_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({super.key});

  @override
  Widget build(BuildContext context) {
    
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(),
      child: Row(
        children: [
          Card(
            color: ColorsManager.blue,
            margin: REdgeInsets.only(top: 0,bottom: 0,left: 10),
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Icon(
                Icons.location_searching_outlined,
                color: ColorsManager.white,
                size: 30,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            "Cairo,Egypt",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: ColorsManager.blue,
            ),
          ),
          Spacer(),

          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios,
              color: ColorsManager.blue,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}
