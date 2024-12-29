// Drawer Content List
import 'package:duseca_assignment/src/core/models/calendars_model.dart';
import 'package:duseca_assignment/src/core/models/drawer_model.dart';
import 'package:duseca_assignment/src/core/shared_widgets/asset_image_widget.dart';
import 'package:duseca_assignment/src/core/shared_widgets/text_widget.dart';
import 'package:duseca_assignment/src/features/chat%20list/data/models/chat_model.dart';
import 'package:duseca_assignment/src/features/overview/data/models/social_stat_model.dart';
import 'package:duseca_assignment/src/utils/constants/app_assets.dart';
import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:duseca_assignment/src/utils/style/app_string.dart';
import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// Container Decortation
final decoration = BoxDecoration(
  color: kWhiteColor,
  borderRadius: BorderRadius.circular(16),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      blurRadius: 20,
      spreadRadius: 2,
      offset: const Offset(0, 5),
    ),
  ],
);

final decorationWithOutShadow = BoxDecoration(
  border: Border.all(color: kLightGrayColor),
  borderRadius: BorderRadius.circular(14),
);

final dropDownDecoration = InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: kLightGrayColor),
    borderRadius: BorderRadius.circular(14.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: kLightGrayColor),
    borderRadius: BorderRadius.circular(14.0),
  ),
  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
);

final dropDownList = const [
  DropdownMenuItem(
    value: 'This Week',
    child: Text('This Week'),
  ),
  DropdownMenuItem(
    value: 'Last Week',
    child: Text('Last Week'),
  ),
  DropdownMenuItem(
    value: 'This Month',
    child: Text('This Month'),
  ),
];

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

// Social Account List
List<SocialStatModel> socialAccountList = [
  SocialStatModel(
    socialIconPath: Assets.assetsIconsFacebookIcon,
    name: AppString.mitchellcooper,
    socialAccount: AppString.facebook,
    socialFollowerCount: AppString.followercount,
    followers: AppString.followers,
    growthPercentage: AppString.growthPercentage,
  ),
  SocialStatModel(
    socialIconPath: Assets.assetsIconsInstagramIcon,
    name: AppString.mitchellcooper,
    socialAccount: AppString.instagram,
    socialFollowerCount: AppString.followercount,
    followers: AppString.followers,
    growthPercentage: AppString.growthPercentage,
  )
];

// Activity Tooltip Behavior
final activityToolTip = TooltipBehavior(
  enable: true,
  canShowMarker: true,
  builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
      int seriesIndex) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextWidget(
            '\$${data.value.toStringAsFixed(3)}',
            style: AppStyle.nunitoMedium15Black,
          ),
          4.verticalSpace,
          TextWidget(
            '23 August, 2021',
            style: AppStyle.nunitoRegular14Gray,
          ),
        ],
      ),
    );
  },
);

// List of events
final List<Map<String, dynamic>> events = [
  {
    "startTime": "07:00",
    "title": "Brandbook and Guidebook",
    "subtitle": "Design",
    "avatars": [
      Assets.assetsIconsMale1Icon,
      Assets.assetsIconsMale2Icon,
      Assets.assetsIconsMale3Icon,
      Assets.assetsIconsMale4Icon,
    ],
  },
  {
    "startTime": "08:30",
    "title": "App Development",
    "subtitle": "Coding",
    "avatars": [
      Assets.assetsIconsMale1Icon,
      Assets.assetsIconsFemale1Icon,
      Assets.assetsIconsFemale2Icon,
      Assets.assetsIconsMale3Icon,
    ],
  },
  {
    "startTime": "10:00",
    "title": "Landing Page",
    "subtitle": "Meeting",
    "avatars": [
      Assets.assetsIconsMale2Icon,
      Assets.assetsIconsMale4Icon,
      Assets.assetsIconsFemale3Icon,
      Assets.assetsIconsFemale1Icon,
    ],
  },
  {
    "startTime": "11:30",
    "title": "Project 'Rocket'",
    "subtitle": "Meeting",
    "avatars": [
      Assets.assetsIconsMale2Icon,
      Assets.assetsIconsMale4Icon,
      Assets.assetsIconsFemale3Icon,
      Assets.assetsIconsFemale1Icon,
    ],
  },
];

final List<PinnedChat> pinnedChats = [
  PinnedChat(
    avatar: CircleAvatar(
      backgroundColor: Colors.purple,
      child: Text("A", style: AppStyle.nunitoBold18White),
    ),
    title: "Alphaboard",
    subtitle: "Jane: Hello, Mark! I am wr...",
    badgeCount: 3,
  ),
  PinnedChat(
    avatar: CircleAvatar(
      backgroundColor: Colors.orange,
      child: const TextWidget("DT", style: AppStyle.nunitoBold18White),
    ),
    title: "Design Team",
    subtitle: "You: Hello. Can you drop t...",
    badgeCount: null,
  ),
  PinnedChat(
    avatar: AssetImageWidget(
        path: Assets.assetsIconsMale3Icon, width: 40.w, height: 40.h),
    title: "Dustin Williamson",
    subtitle: "Dustin is typing...",
    badgeCount: 5,
  ),
];

final List<AllChat> allChats = [
  AllChat(
    avatar: AssetImageWidget(
        path: Assets.assetsIconsFemale1Icon, width: 40.w, height: 40.h),
    title: "Jane Wilson",
    subtitle: "Hi! How are you, Steve? 😊",
  ),
  AllChat(
    avatar: AssetImageWidget(
        path: Assets.assetsIconsMale2Icon, width: 40.w, height: 40.h),
    title: "Brandon Pena",
    subtitle: "How about going somew...",
  ),
  AllChat(
    avatar: AssetImageWidget(
        path: Assets.assetsIconsMale5Icon, width: 40.w, height: 40.h),
    title: "Kristin Mccoy",
    subtitle: "It looks amazing!",
  ),
  AllChat(
    avatar: AssetImageWidget(
        path: Assets.assetsIconsMale6Icon, width: 40.w, height: 40.h),
    title: "Shane Black",
    subtitle: "Paul's having a party tom..",
  ),
];
