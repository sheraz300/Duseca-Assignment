import 'package:duseca_assignment/src/core/shared_widgets/text_widget.dart';
import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';

class CustomeBadge extends StatelessWidget {
  final int count;

  const CustomeBadge({required this.count, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        color: kOrangeColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: TextWidget(
          count.toString(),
          style: AppStyle.nunitoBold11White,
        ),
      ),
    );
  }
}
