import 'package:duseca_assignment/src/core/shared_widgets/asset_image_widget.dart';
import 'package:duseca_assignment/src/core/shared_widgets/custom_container.dart';
import 'package:duseca_assignment/src/core/shared_widgets/text_widget.dart';
import 'package:duseca_assignment/src/utils/constants/app_assets.dart';
import 'package:duseca_assignment/src/utils/constants/constants.dart';
import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:duseca_assignment/src/utils/style/app_string.dart';
import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  final String category;
  final double value;

  ChartData(this.category, this.value);
}

Widget activityChartWidget() {
  return Padding(
    padding: EdgeInsets.only(left: 16.w),
    child: CustomContainer(
      width: 340,
      height: 480,
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
                AppString.activity,
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
                AppString.activityAmount,
                style: AppStyle.nunitoMedium32Black,
              ),
              8.horizontalSpace,
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
                      AppString.activityPercent,
                      style: AppStyle.nunitoMedium15Green,
                    ),
                  ],
                ),
              ),
            ],
          ),
          16.verticalSpace,
          SizedBox(
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              tooltipBehavior: activityToolTip,
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
              series: <SplineSeries<ChartData, String>>[
                SplineSeries<ChartData, String>(
                  dataSource: [
                    ChartData('M', 7),
                    ChartData('T', 10),
                    ChartData('W', 5),
                    ChartData('F', 20),
                  ],
                  xValueMapper: (ChartData data, _) => data.category,
                  yValueMapper: (ChartData data, _) => data.value,
                  color: Colors.orange,
                  splineType: SplineType.natural,
                  markerSettings: const MarkerSettings(
                    isVisible: true,
                    color: Colors.white,
                    borderColor: Color(0xFFFFA726),
                    borderWidth: 2,
                    height: 10,
                    width: 10,
                  ),
                  enableTooltip: true,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
