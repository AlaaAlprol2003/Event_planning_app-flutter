import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/widgets/custom_tabbar.dart';
import 'package:evently_app/core/widgets/event_item.dart';

import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/models/event_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFregment extends StatefulWidget {
  const HomeFregment({super.key});

  @override
  State<HomeFregment> createState() => _HomeFregmentState();
}

class _HomeFregmentState extends State<HomeFregment> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: REdgeInsets.only(top: 48.h, left: 16.w, right: 16),

          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsManager.blue,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Welcome Back ✨",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      Text(
                        "Alaa Ahmed",
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
                      IconButton(onPressed: (){}, icon: Icon (Icons.light_mode, color: ColorsManager.whiteBlue)),
                      SizedBox(width: 12.w),
                      GestureDetector(
                        child: Card(
                          color: ColorsManager.whiteBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Padding(
                            padding: REdgeInsets.all(8.0),
                            child: Text(
                              "En",
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
                category: CategoryModel.tabBarItemsWithAll,
                selectedBgColor: ColorsManager.white,
                selectedFgColor: ColorsManager.blue,
                unSelectedBgColor: Colors.transparent,
                unSelectedFgColor: ColorsManager.white,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            
            itemBuilder: (context, index) => EventItem(
              event: EventModel(
                category: CategoryModel.tabBarItems[2],
                title: "Meeting for Updating The Development Method ",
                description: "Meeting for Updating The Development Method ",
                dateTime: DateTime.now(),
                timeOfDay: TimeOfDay.now(),
              ),
            ),
           
            itemCount: 20,
          ),
        ),
        
      ],
    );
  }
}
