import 'package:evently_app/core/resources/colors_manager.dart';


import 'package:evently_app/core/widgets/event_item.dart';
import 'package:evently_app/l10n/app_localizations.dart';
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
              
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.search_for_event,
                hintStyle: GoogleFonts.inter(fontSize: 20.sp,fontWeight: FontWeight.bold,color: ColorsManager.blue),
                prefixIcon: Icon(Icons.search,color: ColorsManager.blue,),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: ColorsManager.blue,width: 1.w)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: ColorsManager.blue,width: 1.w)
                )
              ),
            )
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => EventItem(
                event: EventModel(
                  category: CategoryModel.getCategories(context)[2],
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
