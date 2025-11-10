import 'package:evently_app/models/category_model.dart';
import 'package:flutter/material.dart';

class EventModel {
  String eventID;
  String userID;
  CategoryModel category;
  String title;
  String description;
  DateTime dateTime;
  String? location;

  EventModel({
    required this.category,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.eventID,
    required this.userID,
    this.location
  });

  EventModel.fromJson(Map<String, dynamic> json, BuildContext context)
    : this(
        eventID: json["eventID"],
        userID: json["userID"],
        category: CategoryModel.getCategories(
          context,
        ).firstWhere((item) => item.id == json["categoryID"]),
        title: json["title"],
        description: json["description"],
        dateTime: json["dateTime"].toDate(),
        location: json["location"] ?? "",
      );

  Map<String, dynamic> toJson() {
    return {
      "eventID": eventID,
      "userID": userID,
      "categoryID": category.id,
      "title": title,
      "description": description,
      "dateTime": dateTime,
      "location":location,
    };
  }
}
