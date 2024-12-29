import 'package:duseca_assignment/src/core/models/drawer_model.dart';
import 'package:duseca_assignment/src/core/shared_widgets/asset_image_widget.dart';
import 'package:duseca_assignment/src/core/shared_widgets/text_widget.dart';
import 'package:duseca_assignment/src/utils/constants/app_assets.dart';
import 'package:duseca_assignment/src/utils/constants/constants.dart';
import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:duseca_assignment/src/utils/style/app_string.dart';
import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomDrawer({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final double drawerWidth = 250;

    return Container(
      width: drawerWidth,
      decoration: BoxDecoration(
          color: kPrimaryColor,
          border: Border(
            right: BorderSide(color: kLightGrayColor, width: 1),
            top: BorderSide(color: kLightGrayColor, width: 1),
          )),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 50.h),
              child: Row(
                children: [
                  AssetImageWidget(
                    path: Assets.assetsIconsLogo,
                    fit: BoxFit.contain,
                  ),
                  10.horizontalSpace,
                  TextWidget(
                    AppString.alpha,
                    style: AppStyle.comfortaaBold26Black,
                  )
                ],
              ),
            ),
            25.verticalSpace,
            SizedBox(
              height: 620.h,
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: drawerList.length,
                itemBuilder: (context, index) {
                  final item = drawerList[index];
                  return _buildDrawerItem(item, index);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 26,
                right: 22,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    AppString.calendars.toUpperCase(),
                    style: AppStyle.nunitoBold15DarkGray,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: kDarkGrayColor,
                        size: 20,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 18,
                right: 18,
              ),
              child: Column(
                children: calendarsList.map((calendar) {
                  return Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Row(
                      children: [
                        Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: calendar.colors,
                            shape: BoxShape.circle,
                          ),
                        ),
                        20.horizontalSpace,
                        Text(
                          calendar.title,
                          style: AppStyle.nunitoRegular15Black,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(DrawerModel drawerItem, int index) {
    bool isSelected = selectedIndex == index;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      title: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AssetImageWidget(
                path: drawerItem.svgPath,
                fit: BoxFit.contain,
                color: isSelected ? Colors.blue : null,
              ),
              15.horizontalSpace,
              TextWidget(
                drawerItem.text,
                style: isSelected
                    ? AppStyle.nunitoBold15Blue
                    : AppStyle.nunitoBold15Black,
              ),
            ],
          ),
        ),
      ),
      trailing: Padding(
        padding: EdgeInsets.only(right: 20.w),
        child: drawerItem.trailing ?? SizedBox.shrink(),
      ),
      onTap: () {
        onItemSelected(index);
      },
    );
  }
}
