


import 'package:evently_app/features/main_layout/home/tab_bar_item.dart';
import 'package:evently_app/models/category_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabbar extends StatefulWidget {
  const CustomTabbar({
    super.key,
    required this.selectedBgColor,
    required this.selectedFgColor,
    required this.unSelectedBgColor,
    required this.unSelectedFgColor, required this.category, this.onCategoryItemClicked, this.tabController,required this.effectiveIndex, required this.selectedIndex,
   
  });
  final Color selectedBgColor;
  final Color selectedFgColor;
  final Color unSelectedBgColor;
  final Color unSelectedFgColor;
  final List<CategoryModel> category;
  final void Function(CategoryModel)? onCategoryItemClicked;
  final TabController? tabController;
  final int effectiveIndex;
  final int selectedIndex;
  
  @override
  State<CustomTabbar> createState() => _CustomTabbarState();
}

class _CustomTabbarState extends State<CustomTabbar> {
 late int selectedIndex = widget.selectedIndex;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.category.length,
      initialIndex: widget.effectiveIndex,
      child: TabBar(
        onTap: (newIndex) {
          widget.onCategoryItemClicked?.call(widget.category[newIndex]);
          selectedIndex = newIndex;
          setState(() {});
        },
        controller: widget.tabController,
        
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        labelPadding: REdgeInsets.symmetric(horizontal: 10.w),
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        tabs: widget.category.map((item) => TabBarItem(
                category: item,
                selectedBgColor: widget.selectedBgColor,
                unSelectedBgColor: widget.unSelectedBgColor,
                selectedFgColor: widget.selectedFgColor,
                unSelectedFgColor: widget.unSelectedFgColor,
                isSelected:
                    selectedIndex ==
                    widget.category.indexOf(item),
              ),
            )
            .toList(),
      ),
    );
  }
}
