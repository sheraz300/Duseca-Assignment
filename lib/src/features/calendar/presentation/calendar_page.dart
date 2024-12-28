import 'package:duseca_assignment/src/core/shared_widgets/text_widget.dart';
import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();

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
              const SizedBox(height: 20),
              _buildTabSelector(),
              const SizedBox(height: 20),
              _buildCalendar(),
              const SizedBox(height: 20),
              _buildUpcomingEvents(),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _buildTabButton('Month', isSelected: true),
            const SizedBox(width: 8),
            _buildTabButton('Week'),
            const SizedBox(width: 8),
            _buildTabButton('Day'),
          ],
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: kBlueColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.add, color: kWhiteColor, size: 32),
              onPressed: () {},
            ),
          ),
        ),
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
    return Card(
      color: kWhiteColor,
      elevation: 2,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upcoming',
        ),
        const SizedBox(height: 16),
        _buildEventCard(
          time: '07:00',
          title: 'Brandbook and Guidebook',
          type: 'Design',
          color: Colors.orange,
          participants: ['A', 'B', 'C', 'D'],
        ),
        const SizedBox(height: 8),
        _buildEventCard(
          time: '08:30',
          title: 'App Development',
          type: 'Coding',
          color: Colors.green,
          participants: ['E', 'F', 'G', 'H'],
        ),
        const SizedBox(height: 8),
        _buildEventCard(
          time: '10:00',
          title: 'Landing Page',
          type: 'Meeting',
          color: Colors.blue,
          participants: ['I', 'J', 'K', 'L'],
        ),
        const SizedBox(height: 8),
        _buildEventCard(
          time: '11:30',
          title: 'Project "Rocket"',
          type: 'Meeting',
          color: Colors.yellow,
          participants: ['M', 'N', 'O', 'P'],
        ),
      ],
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
