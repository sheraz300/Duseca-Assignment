import 'package:duseca_assignment/src/core/shared_widgets/custom_container.dart';
import 'package:duseca_assignment/src/core/shared_widgets/text_widget.dart';
import 'package:duseca_assignment/src/features/calendar/presentation/widgets/time_line_item.dart';
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
                "Calendar",
                style: AppStyle.nunitoBold28Black,
              ),
              const SizedBox(height: 20),
              _buildTabSelector(),
              const SizedBox(height: 20),
              _buildCalendar(),
              const SizedBox(height: 20),
              // _buildUpcomingEvents(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Calendar',
        ),
        Row(
          children: [
            Icon(Icons.search, color: Colors.black),
            const SizedBox(width: 16),
            Icon(Icons.notifications, color: Colors.black),
            const SizedBox(width: 16),
            CircleAvatar(
              backgroundColor: Colors.purple,
              child: Text('MC'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabSelector() {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: kTabBGColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    // Month Tab
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTabIndex = 0;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 80.w,
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
                        child: Text(
                          'Month',
                          style: TextStyle(
                            color: selectedTabIndex == 0
                                ? Colors.black
                                : Colors.grey,
                            fontWeight: selectedTabIndex == 0
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Week Tab
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
                        child: Text(
                          'Week',
                          style: TextStyle(
                            color: selectedTabIndex == 1
                                ? Colors.black
                                : Colors.grey,
                            fontWeight: selectedTabIndex == 1
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Divider
                    Container(
                      height: 20,
                      width: 1,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(width: 16),
                    // Day Tab
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
                        child: Text(
                          'Day',
                          style: TextStyle(
                            color: selectedTabIndex == 2
                                ? Colors.black
                                : Colors.grey,
                            fontWeight: selectedTabIndex == 2
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Add Button
              Container(
                height: 45.w,
                width: 45.w,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        // SizedBox(
        //   child: Center(
        //     // Content based on selected tab
        //     child: Text(
        //       selectedTabIndex == 0
        //           ? 'Month View'
        //           : selectedTabIndex == 1
        //               ? 'Week View'
        //               : 'Day View',
        //       style: TextStyle(
        //         fontSize: 24,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.black87,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildTabButton(String text, {bool isSelected = false}) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.blue),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      onPressed: () {},
      child: Text(
        text,
      ),
    );
  }

  Widget _buildCalendar() {
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
          formatButtonVisible: false,
          titleCentered: true,
        ),
        calendarFormat: CalendarFormat.month,
      ),
    );
  }

  Widget _buildUpcomingEvents() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          TimeLineItem(
            time: "07:00",
            title: "Brandbook and Guidebook",
            category: "Design",
            iconColor: Colors.orange,
            participants: [
              Assets.assetsIconsMale1Icon,
              Assets.assetsIconsFemale1Icon,
              Assets.assetsIconsMale2Icon,
              Assets.assetsIconsFemale2Icon,
            ],
          ),
          TimeLineItem(
            time: "08:30",
            title: "App Development",
            category: "Coding",
            iconColor: Colors.green,
            participants: [
              Assets.assetsIconsMale1Icon,
              Assets.assetsIconsFemale1Icon,
              Assets.assetsIconsMale2Icon,
              Assets.assetsIconsFemale2Icon,
            ],
            isHighlighted: true,
          ),
          TimeLineItem(
            time: "10:00",
            title: "Landing Page",
            category: "Meeting",
            iconColor: Colors.purple,
            participants: [
              Assets.assetsIconsMale1Icon,
              Assets.assetsIconsFemale1Icon,
              Assets.assetsIconsMale2Icon,
              Assets.assetsIconsFemale2Icon,
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard({
    required String time,
    required String title,
    required String type,
    required Color color,
    required List<String> participants,
  }) {
    return Card(
      color: kWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 4,
              height: 60,
              color: color,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.schedule, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        time,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: participants
                        .map((p) => CircleAvatar(
                              radius: 12,
                              child: Text(p),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
