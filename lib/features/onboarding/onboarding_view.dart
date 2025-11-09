
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key,required this.onboarding});
   final OnboardingModel onboarding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(onboarding.imagePath,width: double.maxFinite,height: 350.h,),
        SizedBox(height: 24.h,),
        Text(onboarding.title,style: GoogleFonts.inter(fontSize: 20.sp,fontWeight: FontWeight.bold,color: ColorsManager.blue),),
        SizedBox(height: 24.h,),
        Expanded(child: Text(onboarding.description,style:Theme.of(context).textTheme.displayMedium ))

      ],
    );
  }
}