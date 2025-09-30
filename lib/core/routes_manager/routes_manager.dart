// ignore_for_file: body_might_complete_normally_nullable

import 'package:evently_app/features/auth/login/login.dart';

import 'package:evently_app/features/auth/register/register.dart';
import 'package:evently_app/features/create_event/create_event.dart';
import 'package:evently_app/features/main_layout/main_layout.dart';
import 'package:flutter/cupertino.dart';


class RoutesManager {
  static const  String register = "/register";
  static const  String login = "/login";
  static const  String mainLayout = "/mainLayout";
  static const  String createEvent = "/ceareEvent";
  
  


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
        return CupertinoPageRoute(builder: (context)=> CreateEvent());
      }
    }

  }

}