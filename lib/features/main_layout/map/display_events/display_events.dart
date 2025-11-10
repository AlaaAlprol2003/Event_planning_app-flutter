import 'package:evently_app/features/main_layout/map/display_events/event_card.dart';
import 'package:evently_app/firebase/firebase_services.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayEvents extends StatelessWidget {
  const DisplayEvents({super.key, });
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseServices.getEventsFromFirestore(context),
       builder: (context,snapshot){
         if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
         }else if(snapshot.hasError){
          return Text(snapshot.error.toString());
         }
         List<EventModel> events = snapshot.data ?? [];
         return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index)=> EventCard(event: events[index],),
           separatorBuilder: (context,index)=> SizedBox(width: 12.w,),
           itemCount: events.length);
       }
       );
  }
}