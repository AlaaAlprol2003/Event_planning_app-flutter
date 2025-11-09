import 'package:evently_app/config/providers/lang_provider_config.dart';
import 'package:evently_app/config/providers/theme_provider_config.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/widgets/custom_tabbar.dart';
import 'package:evently_app/core/widgets/event_item.dart';
import 'package:evently_app/firebase/firebase_services.dart';
import 'package:evently_app/l10n/app_localizations.dart';

import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/models/user_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeFregment extends StatefulWidget {
  const HomeFregment({super.key});

  @override
  State<HomeFregment> createState() => _HomeFregmentState();
}

class _HomeFregmentState extends State<HomeFregment> {
  int selectedIndex = 0;
late  CategoryModel selectedCategory = CategoryModel.getCategoriesWithAll(context)[0];
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanagugeProvider lanagugeProvider = Provider.of<LanagugeProvider>(context);
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Padding(
      padding:  REdgeInsets.only(bottom:90),
      child: Column(
        children: [
          Container(
            padding: REdgeInsets.only(top: 48.h, left: 16.w, right: 16),
      
            width: double.infinity,
            decoration: BoxDecoration(
              color: themeProvider.isDark
                  ? ColorsManager.darkBlue
                  : ColorsManager.blue,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "${appLocalizations.welcome_message} ✨",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
      
                        Text(
                          UserModel.user?.name ?? "",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: ColorsManager.whiteBlue,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              "Cairo , Egypt",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            themeProvider.changeAppTheme(
                              themeProvider.isDark
                                  ? ThemeMode.light
                                  : ThemeMode.dark,
                            );
                          },
                          icon: Icon(
                            themeProvider.isDark
                                ? Icons.dark_mode
                                : Icons.light_mode,
                            color: ColorsManager.whiteBlue,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        GestureDetector(
                          onTap: () {
                            lanagugeProvider.changeAppLanaguge(
                              lanagugeProvider.isEnglish ? "ar" : "en",
                            );
                          },
                          child: Card(
                            color: ColorsManager.whiteBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Padding(
                              padding: REdgeInsets.all(8.0),
                              child: Text(
                                lanagugeProvider.isEnglish ? "En" : "ع",
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                CustomTabbar(
                  selectedIndex: 0,
                  effectiveIndex: 0,
                  onCategoryItemClicked: (category){
                    selectedCategory = category;
                    setState(() {
                      
                    });
                  },
                  category: CategoryModel.getCategoriesWithAll(context),
                  selectedBgColor: ColorsManager.white,
                  selectedFgColor: ColorsManager.blue,
                  unSelectedBgColor: Colors.transparent,
                  unSelectedFgColor: ColorsManager.white,
                ),
              ],
            ),
          ),
          
          StreamBuilder(
            stream: FirebaseServices.getEventsFromFirestoreRealTime(context,selectedCategory),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Center(child: CircularProgressIndicator()));
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              List<EventModel> events = snapshot.data ?? [];
             return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) =>
                      EventItem(event: events[index],isEventMarkedAsFavorite: UserModel.user!.favoriteEventsListIds.contains(events[index].eventID)),
                  itemCount: events.length,
                ),
              );
            },
          ),
          
        ],
      ),
    );
  }
}
