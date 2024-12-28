import 'package:duseca_assignment/src/core/shared_widgets/asset_image_widget.dart';
import 'package:duseca_assignment/src/core/shared_widgets/custom_container.dart';
import 'package:duseca_assignment/src/core/shared_widgets/text_widget.dart';
import 'package:duseca_assignment/src/utils/constants/app_assets.dart';
import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:duseca_assignment/src/utils/style/app_string.dart';
import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Widget genderChartWidget() {
  return Padding(
    padding: EdgeInsets.only(left: 16.w),
    child: CustomContainer(
      width: 340,
      height: 450,
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
                AppString.gender,
                style: AppStyle.nunitoMedium20Black,
              ),
              AssetImageWidget(path: Assets.assetsIconsMoreIcon)
            ],
          ),
          SizedBox(
            child: SfCircularChart(
              title: ChartTitle(text: ''),
              annotations: <CircularChartAnnotation>[
                CircularChartAnnotation(
                  height: "70%",
                  width: "70%",
                  widget: Container(
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 20,
                          spreadRadius: 2,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: AssetImageWidget(
                        path: Assets.assetsImagesWoman,
                      ),
                    ),
                  ),
                ),
                // Label for Female
                CircularChartAnnotation(
                  angle: 225,
                  radius: '75%',
                  widget: Container(
                      height: 56.h,
                      width: 56.w,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 20,
                            spreadRadius: 2,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Center(
                          child: TextWidget(
                        AppString.femalePercent,
                        style: AppStyle.nunitoRegular15Black,
                      ))),
                ),
                // Label for Male
                CircularChartAnnotation(
                  angle: 45,
                  radius: '70%',
                  widget: Container(
                      height: 56.h,
                      width: 56.w,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 20,
                            spreadRadius: 2,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Center(
                          child: TextWidget(
                        AppString.malePercent,
                        style: AppStyle.nunitoRegular15Black,
                      ))),
                ),
              ],
              series: <CircularSeries<ChartData, String>>[
                DoughnutSeries<ChartData, String>(
                  dataSource: [
                    ChartData(AppString.male, 42, const Color(0xff7C4DFF)),
                    ChartData(AppString.female, 58, const Color(0xffFFCA28)),
                  ],
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  pointColorMapper: (ChartData data, _) => data.color,
                  innerRadius: '84%', // Adjust for the donut thickness
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: false,
                  ),
                  enableTooltip: true,
                  cornerStyle: CornerStyle.bothCurve,
                  startAngle: 95,
                  endAngle: 92,
                  opacity: 0.78,
                ),
              ],
            ),
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  AssetImageWidget(path: Assets.assetsIconsLabelPurpleIcon),
                  8.horizontalSpace,
                  const TextWidget(
                    "${AppString.male}:",
                    style: AppStyle.nunitoRegular14Gray,
                  ),
                  const TextWidget(
                    AppString.maleCount,
                    style: AppStyle.nunitoMedium15Black,
                  ),
                ],
              ),
              Row(
                children: [
                  AssetImageWidget(path: Assets.assetsIconsLabelYellowIcon),
                  8.horizontalSpace,
                  const TextWidget(
                    "${AppString.female}:",
                    style: AppStyle.nunitoRegular14Gray,
                  ),
                  const TextWidget(
                    AppString.femaleCount,
                    style: AppStyle.nunitoMedium15Black,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final int y;
  final Color color;
}
