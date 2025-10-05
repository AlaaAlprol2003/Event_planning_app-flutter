import 'package:evently_app/core/extensions/date_extension.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class EventItem extends StatefulWidget {
  const EventItem({super.key, required this.event});
  final EventModel event;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 203.h,
      margin: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.event.category.imagePath),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.blue, width: 0.7.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Text(
                    widget.event.dateTime.day.toString(),
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.blue,
                    ),
                  ),
                  Text(
                    widget.event.dateTime.viewMonthName,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Card(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      widget.event.title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                     
                      setState(() {
                         isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(isFavorite?
                      Icons.favorite:Icons.favorite_border_outlined,
                      color: ColorsManager.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

 
}
