import 'package:evently_app/core/resources/colors_manager.dart';

import 'package:evently_app/core/widgets/event_item.dart';
import 'package:evently_app/firebase/firebase_services.dart';
import 'package:evently_app/l10n/app_localizations.dart';

import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteFregment extends StatefulWidget {
  const FavoriteFregment({super.key});

  @override
  State<FavoriteFregment> createState() => _FavoriteFregmentState();
}

class _FavoriteFregmentState extends State<FavoriteFregment> {
  String? userInput;
  late List<EventModel> events;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: TextField(
              onChanged: (input) {
                setState(() {
                  userInput = input;
                });
              },
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: ColorsManager.blue,
              ),
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.search_for_event,
                hintStyle: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.blue,
                ),
                prefixIcon: Icon(Icons.search, color: ColorsManager.blue),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
                ),
              ),
            ),
          ),
          StreamBuilder(
            stream: FirebaseServices.getFavoriteEventsRealTime(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              List<EventModel> events = snapshot.data ?? [];

              List<EventModel> filteredEvents;

              if (userInput == null) {
                filteredEvents = events;
              } else {
                filteredEvents = events
                    .where(
                      (event) => event.category.name.toLowerCase().contains(
                        userInput!.toLowerCase(),
                      ),
                    )
                    .toList();
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: filteredEvents.length,
                  itemBuilder: (context, index) => EventItem(
                    event: filteredEvents[index],
                    isEventMarkedAsFavorite: UserModel
                        .user!
                        .favoriteEventsListIds
                        .contains(events[index].eventID),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
