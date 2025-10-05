import 'dart:math';

import 'package:evently_app/config/providers/lang_provider_config.dart';
import 'package:evently_app/config/providers/theme_provider_config.dart';
import 'package:evently_app/core/prefs_manager/prefs_providers.dart';
import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/features/main_layout/profile/drop_down_menue_widget.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileFregment extends StatelessWidget {
  const ProfileFregment({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanagugeProvider lanagugeProvider = Provider.of<LanagugeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),

          decoration: BoxDecoration(
            color: ColorsManager.blue,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.r)),
          ),
          child: SafeArea(
            bottom: false,
            child: Row(
              children: [
                Image.asset(ImageAssets.profileImage),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Alaa Ahmed",
                        style: GoogleFonts.inter(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.white,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "alaaahmed@gmail.com",
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 24.h),
        DropDownMenueWidget(
          onChange: (selectedTheme){
            PrefsProviders.getTheme();
            themeProvider.changeAppTheme(selectedTheme == appLocalizations.light? ThemeMode.light : ThemeMode.dark );
            
          },
          labelTitle: appLocalizations.theme,
          selectedLabel: themeProvider.isDark  ? appLocalizations.dark : appLocalizations.light,
          menueItems: [appLocalizations.light, appLocalizations.dark],
        ),
        SizedBox(height: 16.h),
        DropDownMenueWidget(
          onChange: (selectedLanaguge){
            lanagugeProvider.changeAppLanaguge(selectedLanaguge == "English"? "en" : "ar");
          },
          labelTitle: appLocalizations.language,
          selectedLabel: lanagugeProvider.isEnglish? "English":"عربى",
          menueItems: ["English", "عربى"],
        ),
        Spacer(flex: 5,),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: REdgeInsets.all(16),
              backgroundColor: ColorsManager.red,
              foregroundColor: ColorsManager.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              iconAlignment: IconAlignment.start,
            ),
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.logout),
                SizedBox(width: 8.w),
                Text(
                  appLocalizations.logout,
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        Spacer(flex: 5,)
      ],
    );
  }
}
