import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event});
  final EventModel event;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      padding: REdgeInsets.only(left: 8,right: 12),
      decoration: BoxDecoration(
        
        color: ColorsManager.white,
        border: Border.all(color: ColorsManager.blue),
        borderRadius: BorderRadius.circular(16.r)
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(event.category.imagePath,height: 100.h,)),
            SizedBox(width: 12.w,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(event.title,style: GoogleFonts.inter(fontSize: 14.sp,fontWeight: FontWeight.bold,color: ColorsManager.blue),),
              SizedBox(height: 16.h,),
              Text(event.location?? "Unknown",softWrap: true,style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14,fontWeight: FontWeight.w500,color: ColorsManager.black1c)),

            ],
          )
        ],
      ),
    );
  }
}