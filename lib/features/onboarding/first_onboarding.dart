import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/widgets/custom_filled_button.dart';
import 'package:evently_app/features/onboarding/animated_toggle.dart';
import 'package:evently_app/features/onboarding/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FirstOnboarding extends StatefulWidget {
  const FirstOnboarding({super.key, required this.index});
  final int index;

  @override
  State<FirstOnboarding> createState() => _FirstOnboardingState();
}

class _FirstOnboardingState extends State<FirstOnboarding> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(ImageAssets.onboardingImage1,height: 350.h,width: double.infinity),
        SizedBox(height: 12),
        Text(
          "Personalize Your Experience",
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: ColorsManager.blue,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(height: 12.h),
        AnimatedToggle(),
        SizedBox(height: 16.h,),
        CustomFilledButton(text: "Let’s Start", onpress: () {
          Provider.of<onboardingProvider>(context,listen: false).changeIndex(widget.index + 1);
          
        }),
      ],
    );
  }
}
