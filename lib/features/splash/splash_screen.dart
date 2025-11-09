import 'dart:async';

import 'package:evently_app/core/prefs_manager/onboarding_prefs.dart';
import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/routes_manager/routes_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),()async{
      bool isFirstTime =await OnboardingPrefs.getIsFirstTime();
      bool isLoggedIn = FirebaseAuth.instance.currentUser != null;
      if(isLoggedIn){
        Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
      }else if(isFirstTime){
        Navigator.pushReplacementNamed(context, RoutesManager.onboarding);
      }
      else {
        Navigator.pushReplacementNamed(context, RoutesManager.login);

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Image.asset(ImageAssets.eventlyLogo),
            Spacer(),
            Padding(
              padding: REdgeInsets.only(bottom: 24.0),
              child: Image.asset(ImageAssets.brandingImage, height: 90.h),
            ),
          ],
        ),
      ),
    );
  }
}
