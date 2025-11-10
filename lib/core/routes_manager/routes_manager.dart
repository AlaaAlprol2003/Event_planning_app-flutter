// ignore_for_file: body_might_complete_normally_nullable


import 'package:evently_app/features/auth/login/login.dart';

import 'package:evently_app/features/auth/register/register.dart';
import 'package:evently_app/features/create_event/create_event.dart';
import 'package:evently_app/features/create_event/create_event_provider.dart';
import 'package:evently_app/features/edit_event/edit_event.dart';
import 'package:evently_app/features/event_details/event_details.dart';
import 'package:evently_app/features/event_location/event_location.dart';
import 'package:evently_app/features/main_layout/main_layout.dart';
import 'package:evently_app/features/onboarding/onboarding_provider.dart';
import 'package:evently_app/features/onboarding/onboarding_screen.dart';
import 'package:evently_app/features/splash/splash_screen.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


class RoutesManager {
  static const  String register = "/register";
  static const  String login = "/login";
  static const  String mainLayout = "/mainLayout";
  static const  String createEvent = "/ceareEvent";
  static const  String eventDetails = "/eventDetails";
  static const  String editEvent = "/editEvent";
  static const String  splash = "/splash";
  static const String  onboarding = "/onboarding";
  static const String  eventLocation = "/eventLocation";




  
  


  static Route? router(RouteSettings settings){
    switch(settings.name){
      case register : {
        return CupertinoPageRoute(builder: (context)=> Register());
      }
      case login :{
        return CupertinoPageRoute(builder: (context)=> Login());
      }
      case mainLayout : {
        return CupertinoPageRoute(builder: (context)=> MainLayout());
      }
       case createEvent : {
        return CupertinoPageRoute(builder: (context)=> ChangeNotifierProvider(
          create: (context)=>CreateEventProvider() ,
          child: CreateEvent()));
      }
      case eventDetails : {
       EventModel event = settings.arguments as EventModel;
       return CupertinoPageRoute(builder: (context)=> EventDetails(event: event,));
      }
      case editEvent:{
        EventModel event = settings.arguments as EventModel;
        return CupertinoPageRoute(builder: (context)=> EditEvent(event: event));
      }
      case splash: {
        return CupertinoPageRoute(builder: (context)=> SplashScreen());
      }
      case onboarding: {
        return CupertinoPageRoute(builder: (context)=> ChangeNotifierProvider(
          create: (context)=> onboardingProvider(),
          child: OnboardingScreen()));
      }
      case eventLocation: {
        CreateEventProvider provider = settings.arguments as CreateEventProvider;
        return CupertinoPageRoute(builder: (context)=> EventLocation(provider: provider,));
      }

    }

  }

}