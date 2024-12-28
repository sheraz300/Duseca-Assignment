import 'package:duseca_assignment/src/core/shared_widgets/asset_image_widget.dart';
import 'package:duseca_assignment/src/core/shared_widgets/custom_container.dart';
import 'package:duseca_assignment/src/core/shared_widgets/text_widget.dart';
import 'package:duseca_assignment/src/features/overview/data/models/follower_card_chart_model.dart';
import 'package:duseca_assignment/src/utils/constants/app_assets.dart';
import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:duseca_assignment/src/utils/style/app_string.dart';
import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

List<FollowerCardChartModel> _getChartData() {
  return [
    FollowerCardChartModel('Mon', 50, const Color(0xFF6A5AE0)),
    FollowerCardChartModel('Tue', 70, const Color(0xFF6A5AE0)),
    FollowerCardChartModel('Wed', 80, const Color(0xFF6A5AE0)),
    FollowerCardChartModel('Thu', 100, kOrangeAccentColor),
    FollowerCardChartModel('Fri', 60, const Color(0xFF6A5AE0)),
    FollowerCardChartModel('Sat', 40, const Color(0xFF6A5AE0)),
    FollowerCardChartModel('Sun', 50, const Color(0xFF6A5AE0)),
  ];
}

Widget followerChartWidget() {
  return Padding(
    padding: EdgeInsets.only(left: 16.w),
    child: CustomContainer(
      width: 340,
      height: 430,
      padding: const EdgeInsets.all(16.0),
      backgroundColor: kPrimaryColor,
      margin: EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                AppString.followers,
                style: AppStyle.nunitoMedium20Black,
              ),
              AssetImageWidget(path: Assets.assetsIconsMoreIcon)
            ],
          ),
          8.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextWidget(
                '254,68K',
                style: AppStyle.nunitoMedium32Black,
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    AssetImageWidget(
                      path: Assets.assetsIconsArrowRightTopIcon,
                      color: Colors.green,
                    ),
                    8.horizontalSpace,
                    TextWidget(
                      "6.18%",
                      style: AppStyle.nunitoMedium15Green,
                    ),
                  ],
                ),
              ),
            ],
          ),
          16.verticalSpace,
          SizedBox(
            height: 220.h,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(size: 0),
                majorGridLines: const MajorGridLines(width: 0),
                labelStyle: AppStyle.nunitoRegular14Gray,
              ),
              primaryYAxis: NumericAxis(
                isVisible: false,
              ),
              plotAreaBorderWidth: 0,
              series: <ColumnSeries<FollowerCardChartModel, String>>[
                ColumnSeries<FollowerCardChartModel, String>(
                  dataSource: _getChartData(),
                  xValueMapper: (FollowerCardChartModel data, _) => data.day,
                  yValueMapper: (FollowerCardChartModel data, _) => data.value,
                  pointColorMapper: (FollowerCardChartModel data, _) =>
                      data.color,
                  width: 0.3,
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15), bottom: Radius.circular(15)),
                  isTrackVisible: true,
                  trackColor: kLightGrayColor,
                ),
              ],
            ),
          ),
          8.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    TextWidget(
                      '834',
                      style: AppStyle.nunitoMedium24Green,
                    ),
                    TextWidget(
                      AppString.followers,
                      style: AppStyle.nunitoRegular15DarkGray,
                    ),
                  ],
                ),
                Column(
                  children: [
                    TextWidget(
                      '152',
                      style: AppStyle.nunitoMedium24Orange,
                    ),
                    TextWidget(
                      'Unfollowed',
                      style: AppStyle.nunitoRegular15DarkGray,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
