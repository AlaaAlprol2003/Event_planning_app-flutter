
import 'package:evently_app/core/extensions/date_extension.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/routes_manager/routes_manager.dart';
import 'package:evently_app/core/widgets/custom_event_image.dart';
import 'package:evently_app/core/widgets/custom_outlined_button.dart';
import 'package:evently_app/firebase/firebase_services.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class EventDetails extends StatefulWidget {
 const EventDetails({super.key,required this.event});
  final EventModel event;

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
 
 late String eventId = widget.event.eventID;
  @override
  Widget build(BuildContext context) {
    
    var appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.event_details),
        
        actions:UserModel.user!.id != widget.event.userID ? null : [
          IconButton(onPressed: (){
            Navigator.pushReplacementNamed(context, RoutesManager.editEvent,arguments: widget.event);
          }, icon: Icon(Icons.edit_outlined)),
          IconButton(onPressed: (){
            _onDeleteButtonClicked();
          }, icon: Icon(Icons.delete),color: ColorsManager.red,)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  REdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomEventImage(imagePath: widget.event.category.imagePath),
              SizedBox(height: 16.h,),
              Text(widget.event.title,style: GoogleFonts.inter(fontSize: 24.sp,fontWeight: FontWeight.w500,color: ColorsManager.blue)),
              SizedBox(height: 16.h,),
              Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: ColorsManager.blue,width: 1.w),
                  
                ),
                child: Row(
                  children: [
                    Card(
                      color: ColorsManager.blue,
                      
                      child: Padding(
                        padding:  REdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
                        child: Icon(Icons.calendar_month,size: 30,),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ///SizedBox(height: 5.h,),
                        Text(widget.event.dateTime.formattedDate,style: GoogleFonts.inter(fontSize: 20.sp,fontWeight: FontWeight.w500,color: ColorsManager.blue),),
                        Text(widget.event.dateTime.toFormattedTime,style:  GoogleFonts.inter(fontSize: 20.sp,fontWeight: FontWeight.w500,color: ColorsManager.blue))
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h,),
              CustomOutlinedButton(onChooseEventLocationClicked: (){},position: widget.event.location,),
              SizedBox(height: 16.h,),
              Container(
                width: double.infinity,
                height: 361.h,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsManager.blue,width: 1.w),
                  borderRadius: BorderRadius.circular(16.r),
                  
                ),
                child: Image.asset("assets/images/Frame 83.png",fit: BoxFit.fill,),
              ),
              SizedBox(height: 16.h,),
              Text(appLocalizations.event_description,style: Theme.of(context).textTheme.labelSmall),
              SizedBox(height: 8.h,),

              Text(widget.event.description,style: Theme.of(context).textTheme.labelSmall),

              
        
            ],
          ),
        ),
      ),
    );
  }

  void _onDeleteButtonClicked() {
    FirebaseServices.removeEventsFromFirestore(eventId, context);
    Navigator.pop(context);
  }
}