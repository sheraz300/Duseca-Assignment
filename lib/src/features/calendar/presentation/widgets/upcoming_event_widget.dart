import 'package:duseca_assignment/src/core/shared_widgets/asset_image_widget.dart';
import 'package:duseca_assignment/src/core/shared_widgets/custom_container.dart';
import 'package:duseca_assignment/src/core/shared_widgets/text_widget.dart';
import 'package:duseca_assignment/src/features/calendar/presentation/widgets/dotted_line_painter.dart';
import 'package:duseca_assignment/src/utils/constants/app_assets.dart';
import 'package:duseca_assignment/src/utils/constants/constants.dart';
import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:duseca_assignment/src/utils/style/app_string.dart';
import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget upcomingEventsWidget() {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          AppString.upcoming,
          style: AppStyle.nunitoBold28Black,
        ),
        6.verticalSpace,
        SizedBox(
          height: 800.h,
          width: 500.w,
          child: Stack(
            children: [
              SizedBox(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: List.generate(12, (index) {
                    int hour = 7 + (index ~/ 2);
                    String minutes = (index % 2 == 0) ? "00" : "30";
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        '${hour.toString().padLeft(2, '0')}:$minutes',
                        style: AppStyle.nunitoRegular15Black,
                      ),
                    );
                  }),
                ),
              ),
              ...events.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, dynamic> event = entry.value;
                List<Color> indicatorColors = [
                  Colors.orange,
                  Colors.green,
                  Colors.purple,
                  Colors.yellow
                ];
                Color currentIndicatorColor =
                    indicatorColors[index % indicatorColors.length];
                double spaceAfterCard = 40.0;
                double topPosition = 30.0 + (index * (140.0 + spaceAfterCard));

                return Positioned(
                  top: topPosition,
                  left: 45,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      children: [
                        CustomPaint(
                          size: Size(270.w, 1),
                          painter: DashPainter(),
                        ),
                        CustomContainer(
                          padding: const EdgeInsets.all(16.0),
                          backgroundColor: kPrimaryColor,
                          margin: EdgeInsets.only(bottom: 5),
                          width: 280.w,
                          height: 132.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 4,
                                    height: 80,
                                    color: currentIndicatorColor,
                                  ),
                                  12.horizontalSpace,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        event['title'],
                                        style: AppStyle.nunitoMedium15Black,
                                      ),
                                      4.verticalSpace,
                                      Row(
                                        children: [
                                          TextWidget(
                                            event['subtitle'],
                                            style: AppStyle.nunitoRegular12Gray,
                                          ),
                                          8.horizontalSpace,
                                          AssetImageWidget(
                                              path: Assets.assetsIconsTimeIcon),
                                          const SizedBox(width: 4),
                                          TextWidget(
                                            event['startTime'],
                                            style: AppStyle.nunitoRegular12Gray,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        children: List.generate(
                                          event['avatars'].length,
                                          (avatarIndex) => Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: _buildAvatar(
                                                event['avatars'][avatarIndex]),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        4.verticalSpace,
                        CustomPaint(
                          size: Size(270.w, 1),
                          painter: DashPainter(),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              Positioned(
                top: 170,
                left: 0,
                right: 0,
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          '08:00',
                          style: AppStyle.nunitoRegular14White,
                        ),
                      ),
                    ),
                    Container(
                      height: 4.h,
                      width: 260.w,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        20.verticalSpace,
      ],
    ),
  );
}

Widget _buildAvatar(String assetPath) {
  return AssetImageWidget(path: assetPath);
}
