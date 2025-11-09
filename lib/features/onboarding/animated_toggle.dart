import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_app/config/providers/lang_provider_config.dart';
import 'package:evently_app/config/providers/theme_provider_config.dart';
import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AnimatedToggle extends StatelessWidget {
  const AnimatedToggle({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var langProvider = Provider.of<LanagugeProvider>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Theme",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: ColorsManager.blue,
              ),
            ),
            AnimatedToggleSwitch.dual(
              current: themeProvider.isDark,
              first: false,
              second: true,
              onChanged: (isDark) {
                themeProvider.changeAppTheme(
                  isDark ? ThemeMode.dark : ThemeMode.light,
                );
              },
              iconBuilder: (isDark) => isDark
                  ? const Icon(
                      Icons.mode_night_rounded,
                      color: ColorsManager.black1c,
                    )
                  : const Icon(
                      Icons.wb_sunny_rounded,
                      color: ColorsManager.white,
                    ),
              animationCurve: Curves.easeInOut,
              style: ToggleStyle(
                backgroundColor: Colors.transparent,
                indicatorColor: ColorsManager.blue,
                indicatorBorder: BoxBorder.all(color: ColorsManager.blue),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Lanaguge",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: ColorsManager.blue,
              ),
            ),

            AnimatedToggleSwitch.dual(
              current: langProvider.isEnglish,
              first: false,
              second: true,
              onChanged: (isEnglish) {
                langProvider.changeAppLanaguge(isEnglish ? "en" : "ar");
              },
              iconBuilder: (isEnglish) => isEnglish
                  ? ImageIcon(AssetImage(ImageAssets.usIcon))
                  : ImageIcon(AssetImage(ImageAssets.egIcon)),
              animationCurve: Curves.easeInOut,
              style: ToggleStyle(
                backgroundColor: Colors.transparent,
                indicatorColor: ColorsManager.black1c,
                indicatorBorder: BoxBorder.all(color: ColorsManager.blue),
              ),
              height: 50,
              
            ),
          ],
        ),
      ],
    );
  }
}
