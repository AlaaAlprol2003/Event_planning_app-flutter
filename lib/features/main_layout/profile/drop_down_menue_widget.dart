import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownMenueWidget extends StatelessWidget {
  const DropDownMenueWidget({super.key, required this.labelTitle, required this.selectedLabel, required this.menueItems, this.onChange});
  final String labelTitle;
  final String selectedLabel;
  final List<String> menueItems;
  final void Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  REdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            labelTitle,
            style: Theme.of(context).textTheme.labelMedium
          ),
        ),
        SizedBox(height: 16.h),

        Container(
          padding: REdgeInsets.symmetric(horizontal:  12.h,vertical: 8),
          margin: REdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: ColorsManager.blue,width: 1.w)
        ),
        child: Row(

          children: [
            Text(selectedLabel,style: GoogleFonts.inter(fontSize:20 ,fontWeight:FontWeight.bold ,color: ColorsManager.blue),),
            Spacer(),
            DropdownButton(
              
              dropdownColor: ColorsManager.blue,
              iconEnabledColor: ColorsManager.blue,
              underline: Container(),
              
              items: menueItems.map((item){
                return DropdownMenuItem(
                  value: item,
                  child: Text(item));
              }).toList(),
               onChanged:onChange)
          ],
        ),
        ),
      ],
    );
  }
}