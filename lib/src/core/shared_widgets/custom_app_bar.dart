import 'package:duseca_assignment/src/core/shared_widgets/asset_image_widget.dart';
import 'package:duseca_assignment/src/core/shared_widgets/custom_divider.dart';
import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final TextStyle? titleStyle;
  final String? leadingImagePath;
  final double elevation;
  final List<Widget>? actions;
  final bool showLeading;
  final bool showTitle;
  final bool showUnderline;
  final VoidCallback? onMenuPressed;
  final Color backgroundColor;
  final Color titleColor;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleStyle,
    this.leadingImagePath,
    this.elevation = 0,
    this.actions,
    this.showLeading = true,
    this.showTitle = true,
    this.showUnderline = true,
    this.onMenuPressed,
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.white,
    this.centerTitle = true,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return AppBar(
        surfaceTintColor: backgroundColor,
        backgroundColor: backgroundColor,
        title: showTitle
            ? Text(
                title ?? 'Home',
                style: titleStyle ??
                    const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              )
            : null,
        centerTitle: centerTitle,
        leading: showLeading
            ? Padding(
                padding: EdgeInsets.all(18.0),
                child: SizedBox(
                  width: 14.w,
                  height: 14.h,
                  child: AssetImageWidget(
                    path: leadingImagePath ?? '',
                    fit: BoxFit.contain,
                    onTap: onMenuPressed ?? () {},
                  ),
                ),
              )
            : null,
        actions: actions,
        elevation: elevation,
        bottom: showUnderline
            ? PreferredSize(
                preferredSize: Size.fromHeight(15.h),
                child: CustomDivider(
                  color: kLightGrayColor,
                ),
              )
            : null);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
