import 'package:duseca_assignment/src/core/shared_widgets/asset_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget imageMessageWidget(List<String> imageUrls, {required String time}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Wrap(
          spacing: 8.0,
          children: imageUrls.map((url) {
            return AssetImageWidget(
              path: url,
              height: 80.w,
            );
          }).toList(),
        ),
      ],
    ),
  );
}
