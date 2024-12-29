import 'package:duseca_assignment/src/core/shared_widgets/asset_image_widget.dart';
import 'package:duseca_assignment/src/core/shared_widgets/custom_container.dart';
import 'package:duseca_assignment/src/core/shared_widgets/text_widget.dart';
import 'package:duseca_assignment/src/features/calendar/presentation/widgets/upcoming_event_widget.dart';
import 'package:duseca_assignment/src/utils/constants/app_assets.dart';
import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:duseca_assignment/src/utils/style/app_string.dart';
import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  int selectedTabIndex = 0;
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              14.verticalSpace,
              TextWidget(
                AppString.calendarTitle,
                style: AppStyle.nunitoBold28Black,
              ),
              20.verticalSpace,
              tabSelectorWidget(),
              20.verticalSpace,
              calendarWidget(),
              20.verticalSpace,
              upcomingEventsWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabSelectorWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
              decoration: BoxDecoration(
                color: kTabBGColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTabIndex = 0;
                      });
                    },
                    child: Container(
                      height: 40.h,
                      width: 85.w,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: selectedTabIndex == 0
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: selectedTabIndex == 0
                            ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ]
                            : [],
                      ),
                      child: TextWidget(
                        AppString.month,
                        style: selectedTabIndex == 0
                            ? AppStyle.nunitoMedium15Black
                            : AppStyle.nunitoMedium15DarkGray,
                      ),
                    ),
                  ),
                  16.horizontalSpace,
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTabIndex = 1;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: selectedTabIndex == 1
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: selectedTabIndex == 1
                            ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ]
                            : [],
                      ),
                      child: TextWidget(AppString.week,
                          style: selectedTabIndex == 1
                              ? AppStyle.nunitoMedium15Black
                              : AppStyle.nunitoMedium15DarkGray),
                    ),
                  ),
                  16.horizontalSpace,
                  Container(
                    height: 20,
                    width: 1,
                    color: Colors.grey[400],
                  ),
                  16.horizontalSpace,
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTabIndex = 2;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: selectedTabIndex == 2
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: selectedTabIndex == 2
                            ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ]
                            : [],
                      ),
                      child: TextWidget(AppString.day,
                          style: selectedTabIndex == 2
                              ? AppStyle.nunitoMedium15Black
                              : AppStyle.nunitoMedium15DarkGray),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50.w,
              width: 50.w,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget calendarWidget() {
    return CustomContainer(
      width: 340,
      height: 400,
      padding: const EdgeInsets.all(16.0),
      backgroundColor: kPrimaryColor,
      margin: EdgeInsets.only(bottom: 5),
      child: TableCalendar(
        firstDay: DateTime(2020),
        lastDay: DateTime(2030),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
              color: kBlueColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12)),
          selectedDecoration: BoxDecoration(
              color: kBlueColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12)),
        ),
        headerStyle: HeaderStyle(
          leftChevronIcon:
              AssetImageWidget(path: Assets.assetsIconsLongArrowLeftIcon),
          rightChevronIcon:
              AssetImageWidget(path: Assets.assetsIconsLongArrowRightIcon),
          formatButtonVisible: false,
          titleCentered: true,
        ),
        calendarFormat: CalendarFormat.month,
      ),
    );
  }
}
