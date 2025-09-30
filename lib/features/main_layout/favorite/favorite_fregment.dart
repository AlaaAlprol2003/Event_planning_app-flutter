import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/widgets/custom_text_field.dart';
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
            child: CustomTextField(hintText: "Search for event", prefixIcon: Icon(Icons.search,color: ColorsManager.blue,)
            , borderColor: ColorsManager.blue, hintColor: ColorsManager.blue
            ,)
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
