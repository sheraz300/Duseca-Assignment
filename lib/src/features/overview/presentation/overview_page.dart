import 'package:duseca_assignment/src/core/shared_widgets/asset_image_widget.dart';
import 'package:duseca_assignment/src/core/shared_widgets/text_widget.dart';
import 'package:duseca_assignment/src/features/overview/presentation/widgets/activity_chart_widget.dart';
import 'package:duseca_assignment/src/features/overview/presentation/widgets/follower_card_widget.dart';
import 'package:duseca_assignment/src/features/overview/presentation/widgets/gender_chart_widget.dart';
import 'package:duseca_assignment/src/features/overview/presentation/widgets/social_account_card_widget.dart';
import 'package:duseca_assignment/src/features/overview/presentation/widgets/statistics_chart_widget.dart';
import 'package:duseca_assignment/src/utils/constants/app_assets.dart';
import 'package:duseca_assignment/src/utils/constants/constants.dart';
import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:duseca_assignment/src/utils/style/app_string.dart';
import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            14.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    AppString.overviewTitle,
                    style: AppStyle.nunitoBold28Black,
                  ),
                  Container(
                    height: 40.w,
                    width: 40.w,
                    decoration: decoration,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AssetImageWidget(
                          path: Assets.assetsIconsProgressIcon),
                    ),
                  ),
                ],
              ),
            ),
            14.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 48.w,
                    width: 48.w,
                    decoration: decorationWithOutShadow,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: AssetImageWidget(
                          path: Assets.assetsIconsDownloadIcon),
                    ),
                  ),
                  SizedBox(
                    width: 275.w,
                    child: DropdownButtonFormField<String>(
                      decoration: dropDownDecoration,
                      value: _selectedValue,
                      style: AppStyle.nunitoRegular15Black,
                      hint: const TextWidget(
                        'This Week',
                        style: AppStyle.nunitoRegular15Black,
                      ),
                      items: dropDownList,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value;
                        });
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: kBlackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            14.verticalSpace,
            socialAccountCardWidget(),
            14.verticalSpace,
            followerChartWidget(),
            14.verticalSpace,
            genderChartWidget(),
            14.verticalSpace,
            activityChartWidget(),
            14.verticalSpace,
            statisticsChartWidget(),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
