// ignore_for_file: body_might_complete_normally_nullable


import 'package:evently_app/core/extensions/date_extension.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/ui_utils/ui_utils.dart';

import 'package:evently_app/core/widgets/custom_event_image.dart';
import 'package:evently_app/core/widgets/custom_filled_button.dart';
import 'package:evently_app/core/widgets/custom_outlined_button.dart';
import 'package:evently_app/core/widgets/custom_tabbar.dart';
import 'package:evently_app/core/widgets/custom_text_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/firebase/firebase_services.dart';
import 'package:evently_app/l10n/app_localizations.dart';

import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:toastification/toastification.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({super.key, required this.event});
  final EventModel event;

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late DateTime newDateTime = widget.event.dateTime;
  late TimeOfDay selectedTime = TimeOfDay.fromDateTime(widget.event.dateTime);

  final String newValue = "";
  @override
  void initState() {
    super.initState();
    titleController.text = widget.event.title;
    descriptionController.text = widget.event.description;
  }

  @override
  Widget build(BuildContext context) {
        
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final List<CategoryModel> categories = CategoryModel.getCategories(context);
    final int initialIndex = categories.indexWhere(
      (cat) => cat.id == widget.event.category.id,
    );
    final int effectiveIndex = initialIndex != -1 ? initialIndex : 0;
    return Scaffold(
      appBar: AppBar(title: Text(appLocalizations.edit_event)),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            children: [
              CustomEventImage(imagePath: widget.event.category.imagePath),
              CustomTabbar(
                effectiveIndex: effectiveIndex,
                selectedIndex: effectiveIndex,
                selectedBgColor: ColorsManager.blue,
                selectedFgColor: ColorsManager.white,
                unSelectedBgColor: Colors.transparent,
                unSelectedFgColor: ColorsManager.blue,
                category: CategoryModel.getCategories(context),
                onCategoryItemClicked: (category) {
                  widget.event.category = category;
                },
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                validator: (input) {},
                controller: titleController,
                keyboardType: TextInputType.text,
                prefixIcon: Icon(Icons.edit),
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                validator: (input) {},
                controller: descriptionController,
                lines: 4,
              ),
              SizedBox(height: 16.h),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        newDateTime.toFormattedDate,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Spacer(),
                      CustomTextButton(
                        title: appLocalizations.choose_date,
                        onPressed: chooseEventDate,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        newDateTime.toFormattedTime,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Spacer(),
                      CustomTextButton(
                        title: appLocalizations.choose_time,
                        onPressed: chooseEventTime,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              CustomOutlinedButton(),
              SizedBox(height: 16.h),
              CustomFilledButton(
                text: appLocalizations.update_event,
                onpress: onUpdateEventClicked,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void chooseEventDate() async {
    DateTime selectedDate =
        await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 356)),
        ) ??
        newDateTime;

    newDateTime = selectedDate;
    newDateTime = newDateTime.copyWith(
      hour: selectedTime.hour,
      minute: selectedTime.minute,
    );

    setState(() {});
  }

  void chooseEventTime() async {
    selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
        selectedTime;
    newDateTime = newDateTime.copyWith(
      hour: selectedTime.hour,
      minute: selectedTime.minute,
    );

    setState(() {});
  }

  void onUpdateEventClicked() async {
    widget.event.title = titleController.text;
    widget.event.description= descriptionController.text;
    widget.event.dateTime= newDateTime;
    UiUtils.showLoadingDialog(context);
    await FirebaseServices.updateEventInFirestore(widget.event, context);
    UiUtils.hideLoadingDialog(context);
    UiUtils.showToastificationBar(context, "Event Updated Successfully", ColorsManager.white, Colors.green, Icons.check_circle, ToastificationType.success);
    Navigator.pop(context);
  }
}
