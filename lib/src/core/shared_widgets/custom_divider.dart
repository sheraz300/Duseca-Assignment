import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double thickness;
  final double indent;
  final double endIndent;
  final Color color;
  final double? height;
  final double? dashWidth;
  final bool isDashed;
  final bool isVertical;

  const CustomDivider({
    super.key,
    this.thickness = 1.0,
    this.indent = 0.0,
    this.endIndent = 0.0,
    this.color = Colors.grey,
    this.height,
    this.dashWidth,
    this.isDashed = false,
    this.isVertical = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isVertical) {
      return SizedBox(
        width: thickness,
        height: height ?? double.infinity,
        child: isDashed
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  ((height ?? double.infinity) / dashWidth!).floor(),
                  (index) => SizedBox(
                    height: dashWidth,
                    width: thickness,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: color),
                    ),
                  ),
                ),
              )
            : DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
      );
    }
    if (isDashed && dashWidth != null) {
      return SizedBox(
        height: height ?? thickness,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            ((MediaQuery.of(context).size.width - indent - endIndent) /
                    dashWidth!)
                .floor(),
            (index) => SizedBox(
              width: dashWidth,
              height: thickness,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(left: indent, right: endIndent),
      height: height ?? thickness,
      color: color,
    );
  }
}
