// Drawer Content List
import 'package:duseca_assignment/src/core/models/calendars_model.dart';
import 'package:duseca_assignment/src/core/models/drawer_model.dart';
import 'package:duseca_assignment/src/core/shared_widgets/asset_image_widget.dart';
import 'package:duseca_assignment/src/core/shared_widgets/text_widget.dart';
import 'package:duseca_assignment/src/utils/constants/app_assets.dart';
import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:duseca_assignment/src/utils/style/app_string.dart';
import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<DrawerModel> drawerList = [
  DrawerModel(
    text: AppString.overview,
    svgPath: Assets.assetsIconsDashboardIcon,
    navPath: '',
  ),
  DrawerModel(
      text: AppString.eCommerce,
      svgPath: Assets.assetsIconsCartIcon,
      navPath: '',
      trailing: AssetImageWidget(
        path: Assets.assetsIconsArrowRightIcon,
        color: kOtherColor,
      )),
  DrawerModel(
    text: AppString.calendar,
    svgPath: Assets.assetsIconsCalendarIcon,
    navPath: '',
  ),
  DrawerModel(
    text: AppString.mail,
    svgPath: Assets.assetsIconsMailIcon,
    navPath: '',
    trailing: Container(
      width: 20.w,
      height: 20.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kOrangeColor,
      ),
      child: Center(
        child: TextWidget(
          '8',
          style: AppStyle.nunitoBold11White,
        ),
      ),
    ),
  ),
  DrawerModel(
    text: AppString.chat,
    svgPath: Assets.assetsIconsChatIcon,
    navPath: '',
  ),
  DrawerModel(
    text: AppString.tasks,
    svgPath: Assets.assetsIconsTaskIcon,
    navPath: '',
  ),
  DrawerModel(
    text: AppString.projects,
    svgPath: Assets.assetsIconsProjectsIcon,
    navPath: '',
  ),
  DrawerModel(
    text: AppString.fileManager,
    svgPath: Assets.assetsIconsFileManagerIcon,
    navPath: '',
  ),
  DrawerModel(
    text: AppString.notes,
    svgPath: Assets.assetsIconsNotesIcon,
    navPath: '',
  ),
  DrawerModel(
    text: AppString.contacts,
    svgPath: Assets.assetsIconsContactsIcon,
    navPath: '',
  ),
];

// Calendars List
List<CalendarsModel> calendarsList = [
  CalendarsModel(title: AppString.important, colors: kOrangeColor),
  CalendarsModel(title: AppString.meeting, colors: kOrangeAccentColor),
  CalendarsModel(title: AppString.event, colors: kGreenColor),
  CalendarsModel(title: AppString.work, colors: kPurpleColor),
  CalendarsModel(title: AppString.other, colors: kOtherColor),
];
