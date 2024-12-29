import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';

Widget dividerWidget(String text) {
  return Row(
    children: [
      Expanded(child: Divider()),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(text, style: AppStyle.nunitoRegular12Gray),
      ),
      Expanded(child: Divider()),
    ],
  );
}
