import 'package:duseca_assignment/src/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.child,
    this.width = 300,
    this.height = 150,
    this.backgroundColor = Colors.grey,
    this.margin = const EdgeInsets.only(bottom: 4.0),
    this.padding,
  });

  final Widget child;
  final double width;
  final double height;
  final Color backgroundColor;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: decoration,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          Container(
            margin: margin,
            padding: padding ?? EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: child, // Pass the child widget here
          ),
        ],
      ),
    );
  }
}
