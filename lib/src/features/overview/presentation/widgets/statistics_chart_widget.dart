import 'package:duseca_assignment/src/core/shared_widgets/asset_image_widget.dart';
import 'package:duseca_assignment/src/core/shared_widgets/custom_container.dart';
import 'package:duseca_assignment/src/core/shared_widgets/text_widget.dart';
import 'package:duseca_assignment/src/features/overview/data/models/statistics_chart_model.dart';
import 'package:duseca_assignment/src/utils/constants/app_assets.dart';
import 'package:duseca_assignment/src/utils/constants/constants.dart';
import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:duseca_assignment/src/utils/style/app_string.dart';
import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Widget _tooltipLegend(Color color, String text) {
  return Row(
    children: [
      CircleAvatar(
        radius: 4,
        backgroundColor: color,
      ),
      4.horizontalSpace,
      TextWidget(
        text,
        style: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
      ),
      8.horizontalSpace,
    ],
  );
}

String? _selectedValue;

Widget statisticsChartWidget() {
  return Padding(
    padding: EdgeInsets.only(left: 16.w),
    child: CustomContainer(
      width: 340,
      height: 600,
      padding: const EdgeInsets.all(16.0),
      backgroundColor: kPrimaryColor,
      margin: EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            AppString.statistics,
            style: AppStyle.nunitoMedium20Black,
          ),
          16.verticalSpace,
          SizedBox(
            width: 300.w,
            child: DropdownButtonFormField<String>(
              decoration: dropDownDecoration,
              value: _selectedValue,
              style: AppStyle.nunitoRegular15Black,
              hint: const TextWidget(
                'This Week',
                style: AppStyle.nunitoRegular15Black,
              ),
              items: dropDownList,
              onChanged: (value) {},
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: kBlackColor,
              ),
            ),
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    AppString.share,
                    style: AppStyle.nunitoRegular15DarkGray,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextWidget(
                        AppString.shareCount,
                        style: AppStyle.nunitoMedium28Black,
                      ),
                      8.horizontalSpace,
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
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
                              AppString.activityPercent,
                              style: AppStyle.nunitoMedium15Green,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    AppString.likes,
                    style: AppStyle.nunitoRegular15DarkGray,
                  ),
                  4.verticalSpace,
                  TextWidget(
                    AppString.likeCount,
                    style: AppStyle.nunitoMedium28Black,
                  ),
                ],
              ),
            ],
          ),
          25.verticalSpace,
          // Column Chart
          SizedBox(
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              tooltipBehavior: TooltipBehavior(
                enable: true,
                canShowMarker: true,
                builder: (dynamic data, dynamic point, dynamic series,
                    int pointIndex, int seriesIndex) {
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '23 Aug, 2021',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _tooltipLegend(Color(0xFF6A5AE0), '15,650'),
                            _tooltipLegend(Colors.yellow, '2,550'),
                            _tooltipLegend(Colors.orange, '2,400'),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              primaryXAxis: CategoryAxis(
                majorGridLines: MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                interval: 10,
                majorGridLines: MajorGridLines(
                  dashArray: [5, 5],
                  color: Colors.grey.shade300,
                ),
              ),
              series: <CartesianSeries<StatisticsChartModel, String>>[
                ColumnSeries<StatisticsChartModel, String>(
                  dataSource: [
                    StatisticsChartModel('Mon', 30, Color(0xFF6A5AE0)),
                    StatisticsChartModel('Tue', 20, Color(0xFF6A5AE0)),
                  ],
                  xValueMapper: (StatisticsChartModel data, _) => data.category,
                  yValueMapper: (StatisticsChartModel data, _) => data.value,
                  pointColorMapper: (StatisticsChartModel data, _) =>
                      data.color,
                  width: 0.6,
                  spacing: 0.3,
                  enableTooltip: true,
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15), bottom: Radius.circular(15)),
                ),
                ColumnSeries<StatisticsChartModel, String>(
                  dataSource: [
                    StatisticsChartModel('Mon', 10, Colors.yellow),
                    StatisticsChartModel('Tue', 15, Colors.yellow),
                  ],
                  xValueMapper: (StatisticsChartModel data, _) => data.category,
                  yValueMapper: (StatisticsChartModel data, _) => data.value,
                  pointColorMapper: (StatisticsChartModel data, _) =>
                      data.color,
                  width: 0.6,
                  spacing: 0.3,
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15), bottom: Radius.circular(15)),
                ),
                ColumnSeries<StatisticsChartModel, String>(
                  dataSource: [
                    StatisticsChartModel('Mon', 15, Colors.orange),
                    StatisticsChartModel('Tue', 10, Colors.orange),
                  ],
                  xValueMapper: (StatisticsChartModel data, _) => data.category,
                  yValueMapper: (StatisticsChartModel data, _) => data.value,
                  pointColorMapper: (StatisticsChartModel data, _) =>
                      data.color,
                  width: 0.6,
                  spacing: 0.3,
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15), bottom: Radius.circular(15)),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
