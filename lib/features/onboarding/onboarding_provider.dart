// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class onboardingProvider extends ChangeNotifier {
 
  int index = 0;

  void changeIndex(int currentIndex){
    index = currentIndex;
    notifyListeners();
  }
}