import 'package:duseca_assignment/src/core/shared_widgets/asset_image_widget.dart';
import 'package:duseca_assignment/src/utils/constants/app_assets.dart';
import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget fileMessageWidget({
  required String sender,
  required String fileName,
  required String fileSize,
  required String time,
  Color senderAvatarColor = Colors.blue,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AssetImageWidget(
          path: Assets.assetsIconsMale2Icon,
          height: 40.w,
        ),
        SizedBox(width: 8),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 247, 250, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.insert_drive_file, color: Colors.orange),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(fileName, style: AppStyle.nunitoRegular15Black),
                    Text(fileSize, style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Spacer(),
                AssetImageWidget(path: Assets.assetsIconsDownloadIcon),
                5.horizontalSpace,
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
