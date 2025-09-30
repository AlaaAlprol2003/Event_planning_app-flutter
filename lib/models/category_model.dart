import 'package:evently_app/core/resources/assets_manager.dart';
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

  static List<CategoryModel> tabBarItemsWithAll = [
    CategoryModel(
      id: '0',
      name: 'All',
      icon: Icons.all_inclusive,
      imagePath: '',
    ),
    CategoryModel(
      id: '1',
      name: 'Sports',
      icon: Icons.sports_soccer_rounded,
      imagePath: ImageAssets.sport,
    ),
    CategoryModel(
      id: '2',
      name: 'Birthday',
      icon: Icons.celebration,
      imagePath: ImageAssets.birthDay,
    ),
    CategoryModel(
      id: '3',
      name: 'Meeting',
      icon: Icons.groups_2_rounded,
      imagePath: ImageAssets.meeting,
    ),
    CategoryModel(
      id: '4',
      name: 'Gaming',
      icon: Icons.sports_esports_rounded,
      imagePath: ImageAssets.gaming,
    ),
    CategoryModel(
      id: '5',
      name: 'Eating',
      icon: Icons.restaurant,
      imagePath: ImageAssets.eating,
    ),
    CategoryModel(
      id: '6',
      name: 'Holiday',
      icon: Icons.beach_access,
      imagePath: ImageAssets.holiday,
    ),
    CategoryModel(
      id: '7',
      name: 'Exhibition',
      icon: Icons.art_track_outlined,
      imagePath: ImageAssets.exhibition,
    ),
    CategoryModel(
      id: '8',
      name: 'Workshop',
      icon: Icons.work,
      imagePath: ImageAssets.workShop,
    ),
    CategoryModel(
      id: '9',
      name: 'Bookclub',
      icon: Icons.menu_book,
      imagePath: ImageAssets.bookClub,
    ),
  ];
  static List<CategoryModel> tabBarItems = [
    CategoryModel(
      id: '0',
      name: 'Sports',
      icon: Icons.sports_soccer_rounded,
      imagePath: ImageAssets.sport,
    ),
    CategoryModel(
      id: '1',
      name: 'Birthday',
      icon: Icons.celebration,
      imagePath: ImageAssets.birthDay,
    ),
    CategoryModel(
      id: '2',
      name: 'Meeting',
      icon: Icons.groups_2_rounded,
      imagePath: ImageAssets.meeting,
    ),
    CategoryModel(
      id: '3',
      name: 'Gaming',
      icon: Icons.sports_esports_rounded,
      imagePath: ImageAssets.gaming,
    ),
    CategoryModel(
      id: '4',
      name: 'Eating',
      icon: Icons.restaurant,
      imagePath: ImageAssets.eating,
    ),
    CategoryModel(
      id: '5',
      name: 'Holiday',
      icon: Icons.beach_access,
      imagePath: ImageAssets.holiday,
    ),
    CategoryModel(
      id: '6',
      name: 'Exhibition',
      icon: Icons.art_track_outlined,
      imagePath: ImageAssets.exhibition,
    ),
    CategoryModel(
      id: '7',
      name: 'Workshop',
      icon: Icons.work,
      imagePath: ImageAssets.workShop,
    ),
    CategoryModel(
      id: '8',
      name: 'Bookclub',
      icon: Icons.menu_book,
      imagePath: ImageAssets.bookClub,
    ),
  ];
}
