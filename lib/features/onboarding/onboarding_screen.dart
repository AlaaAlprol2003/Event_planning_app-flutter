import 'package:evently_app/core/prefs_manager/onboarding_prefs.dart';
import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/routes_manager/routes_manager.dart';
import 'package:evently_app/features/onboarding/custom_arrow_icon.dart';
import 'package:evently_app/features/onboarding/dot_widget.dart';
import 'package:evently_app/features/onboarding/first_onboarding.dart';
import 'package:evently_app/features/onboarding/onboarding_provider.dart';
import 'package:evently_app/features/onboarding/onboarding_view.dart';
import 'package:evently_app/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    int selectedIndex = Provider.of<onboardingProvider>(context).index;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
          child: Column(
            children: [
              Image.asset(ImageAssets.eventlyOnboarding),
              SizedBox(height: 24.h),
              Expanded(
                child: selectedIndex == 0
                    ? FirstOnboarding(index: selectedIndex)
                    : PageView.builder(
                        onPageChanged: (index) {
                          Provider.of<onboardingProvider>(
                            context,
                            listen: false,
                          ).changeIndex(index + 1);
                        },
                        controller: controller,
                        scrollDirection: Axis.horizontal,
                        itemCount: OnboardingModel.onboardingViews.length,
                        itemBuilder: (context, index) => OnboardingView(
                          onboarding: OnboardingModel.onboardingViews[index],
                        ),
                      ),
              ),

              Visibility(
                visible: selectedIndex > 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: selectedIndex >= 2,
                      child: CustomArrowIcon(
                        onArrowIconClicked: () {
                          controller.previousPage(
                            duration: Duration(microseconds: 100),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: Icons.arrow_back,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(3, (index) {
                          return DotWidget(
                            isActive: selectedIndex - 1 == index,
                          );
                        }),
                      ],
                    ),
                    CustomArrowIcon(
                      onArrowIconClicked: () {
                        controller.nextPage(
                          duration: Duration(microseconds: 100),
                          curve: Curves.easeInOut,
                        );
                        if (selectedIndex - 1 ==
                            OnboardingModel.onboardingViews.length - 1) {
                          OnboardingPrefs.setIsFirstTime();
                          Navigator.pushReplacementNamed(
                            context,
                            RoutesManager.login,
                          );
                        }
                      },
                      icon: Icons.arrow_forward,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
