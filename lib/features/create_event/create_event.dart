// ignore_for_file: body_might_complete_normally_nullable

import 'package:evently_app/core/extensions/date_extension.dart';

import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/ui_utils/ui_utils.dart';
import 'package:evently_app/core/widgets/custom_outlined_button.dart';
import 'package:evently_app/core/widgets/custom_tabbar.dart';
import 'package:evently_app/core/widgets/custom_text_button.dart';

import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/firebase/firebase_services.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/models/user_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  late TextEditingController _titleController;

  late TextEditingController _descriptionController;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  late CategoryModel selectedCategory = CategoryModel.getCategories(context)[0];
 
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
          padding: REdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: REdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(selectedCategory.imagePath),
                ),
              ),
              CustomTabbar(
                selectedIndex: 0,
                effectiveIndex: 0,
                onCategoryItemClicked: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
                selectedBgColor: ColorsManager.blue,
                selectedFgColor: ColorsManager.whiteBlue,
                unSelectedBgColor: Colors.transparent,
                unSelectedFgColor: ColorsManager.blue,
                category: CategoryModel.getCategories(context),
              ),
              SizedBox(height: 16.h),
              Text(
                appLocalizations.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
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
                    selectedDate.toFormattedDate,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Spacer(),
                  CustomTextButton(
                    title: appLocalizations.choose_date,
                    onPressed: _selectEventDate,
                  ),
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
                    selectedDate.toFormattedTime,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Spacer(),
                  CustomTextButton(
                    title: appLocalizations.choose_time,
                    onPressed: _selectEventTime,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              CustomOutlinedButton(),
              SizedBox(height: 16.h),

              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _onAddEventClicked,
                  child: Text(appLocalizations.add_event),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectEventDate() async {
    selectedDate =
        await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
        ) ??
        selectedDate;
    selectedDate = selectedDate.copyWith(
      hour: selectedTime.hour,
      minute: selectedTime.minute,
    );
    setState(() {});
  }

  void _selectEventTime() async {
    selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
        selectedTime;
    selectedDate = selectedDate.copyWith(
      hour: selectedTime.hour,
      minute: selectedTime.minute,
    );
    setState(() {});
  }

  void _onAddEventClicked() async {
    EventModel event = EventModel(
      category: selectedCategory,
      title: _titleController.text,
      description: _descriptionController.text,
      dateTime: selectedDate,
      eventID: "",
      userID: UserModel.user!.id,
    );
    UiUtils.showLoadingDialog(context);
    await FirebaseServices.addEventToFireStore(event, context);
    UiUtils.hideLoadingDialog(context);
    UiUtils.showToastificationBar(
      context,
      "Event Created Successfully",
      ColorsManager.white,
      Colors.green,
      Icons.check_circle,
      ToastificationType.success,
    );
    Navigator.pop(context);
  }
}
