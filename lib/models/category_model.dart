import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String name;
  IconData icon;
  String imagePath;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.imagePath,
  });


  static List<CategoryModel> getCategoriesWithAll(BuildContext context){
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
     return  [

    CategoryModel(
      id: '0',
      name: appLocalizations.all,
      icon: Icons.all_inclusive,
      imagePath: '',
    ),
    CategoryModel(
      id: '1',
      name: appLocalizations.sports,
      icon: Icons.sports_soccer_rounded,
      imagePath: ImageAssets.sport,
    ),
    CategoryModel(
      id: '2',
      name: appLocalizations.birthday,
      icon: Icons.celebration,
      imagePath: ImageAssets.birthDay,
    ),
    CategoryModel(
      id: '3',
      name: appLocalizations.meeting,
      icon: Icons.groups_2_rounded,
      imagePath: ImageAssets.meeting,
    ),
    CategoryModel(
      id: '4',
      name: appLocalizations.gamin,
      icon: Icons.sports_esports_rounded,
      imagePath: ImageAssets.gaming,
    ),
    CategoryModel(
      id: '5',
      name: appLocalizations.eating,
      icon: Icons.restaurant,
      imagePath: ImageAssets.eating,
    ),
    CategoryModel(
      id: '6',
      name: appLocalizations.holiday,
      icon: Icons.beach_access,
      imagePath: ImageAssets.holiday,
    ),
    CategoryModel(
      id: '7',
      name: appLocalizations.exhibition,
      icon: Icons.art_track_outlined,
      imagePath: ImageAssets.exhibition,
    ),
    CategoryModel(
      id: '8',
      name: appLocalizations.workshop,
      icon: Icons.work,
      imagePath: ImageAssets.workShop,
    ),
    CategoryModel(
      id: '9',
      name: appLocalizations.book_club,
      icon: Icons.menu_book,
      imagePath: ImageAssets.bookClub,
    ),
  ];
  }

  static List<CategoryModel> getCategories(BuildContext context){
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
     return  [

   
    CategoryModel(
      id: '1',
      name: appLocalizations.sports,
      icon: Icons.sports_soccer_rounded,
      imagePath: ImageAssets.sport,
    ),
    CategoryModel(
      id: '2',
      name: appLocalizations.birthday,
      icon: Icons.celebration,
      imagePath: ImageAssets.birthDay,
    ),
    CategoryModel(
      id: '3',
      name: appLocalizations.meeting,
      icon: Icons.groups_2_rounded,
      imagePath: ImageAssets.meeting,
    ),
    CategoryModel(
      id: '4',
      name: appLocalizations.gamin,
      icon: Icons.sports_esports_rounded,
      imagePath: ImageAssets.gaming,
    ),
    CategoryModel(
      id: '5',
      name: appLocalizations.eating,
      icon: Icons.restaurant,
      imagePath: ImageAssets.eating,
    ),
    CategoryModel(
      id: '6',
      name: appLocalizations.holiday,
      icon: Icons.beach_access,
      imagePath: ImageAssets.holiday,
    ),
    CategoryModel(
      id: '7',
      name: appLocalizations.exhibition,
      icon: Icons.art_track_outlined,
      imagePath: ImageAssets.exhibition,
    ),
    CategoryModel(
      id: '8',
      name: appLocalizations.workshop,
      icon: Icons.work,
      imagePath: ImageAssets.workShop,
    ),
    CategoryModel(
      id: '9',
      name: appLocalizations.book_club,
      icon: Icons.menu_book,
      imagePath: ImageAssets.bookClub,
    ),
  ];
  }     
}
