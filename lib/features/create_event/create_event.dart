import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/widgets/custom_tabbar.dart';
import 'package:evently_app/core/widgets/custom_text_button.dart';
import 'package:evently_app/core/widgets/custom_text_field.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text("Create Event"), elevation: 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: REdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(ImageAssets.meeting),
                ),
              ),
              CustomTabbar(
                selectedBgColor: ColorsManager.blue,
                selectedFgColor: ColorsManager.whiteBlue,
                unSelectedBgColor: Colors.transparent,
                unSelectedFgColor: ColorsManager.blue,
                category: CategoryModel.tabBarItems,
              ),
              SizedBox(height: 16.h),
              Text(
                "Title",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              CustomTextField(
                hintText: "Event Title",
                prefixIcon: Icon(Icons.edit_document, color: ColorsManager.grey),
                borderColor: Theme.of(context).colorScheme.onPrimary,
                hintColor: Theme.of(context).colorScheme.onPrimary,
              ),
              SizedBox(height: 16.h),
              Text(
                "Description",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              CustomTextField(
                hintText: 'Event Description',
                minLines: 5,
        
                borderColor: Theme.of(context).colorScheme.onPrimary,
                hintColor: Theme.of(context).colorScheme.onPrimary,
              ),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  SizedBox(width: 4.w,),
                  Text(
                    "Event Date",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  Spacer(),
                  CustomTextButton(title: "Choose Date", onPressed: (){})
                ],
              ),
              SizedBox(height: 8.h,),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  SizedBox(width: 4.w,),
                  Text(
                    "Event Time",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  Spacer(),
                  CustomTextButton(title: "Choose Time", onPressed: (){})
                ],
              ),
              SizedBox(height: 16.h,),
             SizedBox(
              width: double.infinity,
              child: FilledButton(onPressed: (){}, child:Text('Add Event')))
            ],
          ),
        ),
      ),
    );
  }
}
