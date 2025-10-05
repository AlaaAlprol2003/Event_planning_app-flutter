// ignore_for_file: body_might_complete_normally_nullable

import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/widgets/custom_tabbar.dart';
import 'package:evently_app/core/widgets/custom_text_button.dart';

import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CreateEvent extends StatefulWidget {
 const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  late TextEditingController _titleController;

  late TextEditingController _descriptionController;
  
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text(appLocalizations.create_event), elevation: 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: REdgeInsets.all(12.0),
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
                category: CategoryModel.getCategories(context),
              ),
              SizedBox(height: 16.h),
              Text(appLocalizations.title, style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 8.h),
              CustomTextFormField(
                hintText: appLocalizations.event_title,
                hintStyle: Theme.of(context).textTheme.labelSmall,
                prefixIcon: Icon(Icons.edit_document),
                validator: (input) {},
                controller: _titleController,
              ),

              SizedBox(height: 16.h),
              Text(
                appLocalizations.description,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 8.h),
              CustomTextFormField(
                hintText: appLocalizations.event_description,
                hintStyle: Theme.of(context).textTheme.labelSmall,
                lines: 4,
                validator: (input) {},
                controller: _descriptionController,
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    appLocalizations.event_date,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Spacer(),
                  CustomTextButton(title:appLocalizations.choose_date, onPressed: () {
                    showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 365)));
                  }),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    appLocalizations.event_time,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Spacer(),
                  CustomTextButton(title: appLocalizations.choose_time, onPressed: () {
                    showTimePicker(context: context, initialTime: TimeOfDay.now());
                  }),
                ],
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: double.infinity,
                child: FilledButton(onPressed: () {}, child: Text(appLocalizations.add_event)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
