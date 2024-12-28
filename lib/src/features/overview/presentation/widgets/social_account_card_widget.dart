import 'package:duseca_assignment/src/core/shared_widgets/asset_image_widget.dart';
import 'package:duseca_assignment/src/core/shared_widgets/custom_container.dart';
import 'package:duseca_assignment/src/core/shared_widgets/text_widget.dart';
import 'package:duseca_assignment/src/utils/constants/app_assets.dart';
import 'package:duseca_assignment/src/utils/constants/constants.dart';
import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget socialAccountCardWidget() {
  return Padding(
    padding: EdgeInsets.only(left: 10.w),
    child: SizedBox(
      width: 600.w,
      height: 200.h,
      child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: socialAccountList.map((option) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomContainer(
                width: 300,
                backgroundColor: kPrimaryColor,
                margin: EdgeInsets.only(bottom: 5),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AssetImageWidget(
                            path: option.socialIconPath,
                            width: 48.w,
                            height: 48.h,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                option.name,
                                style: AppStyle.nunitoMedium15Black,
                              ),
                              TextWidget(
                                option.socialAccount,
                                style: AppStyle.nunitoRegular14Gray,
                              ),
                            ],
                          ),
                        ],
                      ),
                      16.verticalSpace,
                      Row(
                        children: [
                          TextWidget(
                            option.socialFollowerCount,
                            style: AppStyle.nunitoMedium28Black,
                          ),
                          14.horizontalSpace,
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
                                  option.growthPercentage,
                                  style: AppStyle.nunitoMedium15Green,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      8.verticalSpace,
                      TextWidget(option.followers,
                          style: AppStyle.nunitoRegular15DarkGray),
                    ],
                  ),
                ),
              ),
            );
          }).toList()),
    ),
  );
}
