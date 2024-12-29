import 'package:duseca_assignment/src/features/calendar/presentation/widgets/dotted_line_painter.dart';
import 'package:flutter/material.dart';

class TimeLineItem extends StatelessWidget {
  final String time;
  final String title;
  final String category;
  final Color iconColor;
  final List<String> participants;
  final bool isHighlighted;

  const TimeLineItem({
    super.key,
    required this.time,
    required this.title,
    required this.category,
    required this.iconColor,
    required this.participants,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Dotted line
        // Positioned.fill(
        //   left: 24,
        //   child: CustomPaint(
        //     painter: DottedLinePainter(),
        //   ),
        // ),
        Row(
          children: [
            Container(
              width: 50,
              alignment: Alignment.center,
              child: Text(
                time,
                style: TextStyle(
                  fontSize: 16,
                  color: isHighlighted ? Colors.blue : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  category,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  Icons.access_time,
                                  size: 16,
                                  color: Colors.grey[600],
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  time,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: participants.map((avatar) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(avatar),
                                radius: 16,
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 8,
                    decoration: BoxDecoration(
                      color: iconColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
