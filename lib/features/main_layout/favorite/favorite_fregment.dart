import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/widgets/event_item.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteFregment extends StatelessWidget {
  const FavoriteFregment({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: TextField(
              style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: ColorsManager.blue),
                hintText: "Search for event",
                hintStyle: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.blue,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: ColorsManager.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: ColorsManager.blue),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => EventItem(
                event: EventModel(
                  category: CategoryModel.tabBarItems[2],
                  title: "Meeting for Updating The Development Method ",
                  description: "Meeting for Updating The Development Method ",
                  dateTime: DateTime.now(),
                  timeOfDay: TimeOfDay.now(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
