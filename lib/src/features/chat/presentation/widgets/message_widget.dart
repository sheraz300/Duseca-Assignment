import 'package:duseca_assignment/src/core/shared_widgets/asset_image_widget.dart';
import 'package:duseca_assignment/src/utils/constants/app_assets.dart';
import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget messageWidget({
  required String sender,
  required String message,
  required String time,
  bool isSentByMe = false,
  Color senderAvatarColor = Colors.blue,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isSentByMe)
          AssetImageWidget(
            path: Assets.assetsIconsFemale1Icon,
            height: 40.w,
            width: 40.w,
          ),
        if (!isSentByMe) SizedBox(width: 8),
        Flexible(
          child: Column(
            crossAxisAlignment:
                isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              if (!isSentByMe)
                Row(
                  children: [
                    Text(sender, style: AppStyle.nunitoMedium15Black),
                    8.horizontalSpace,
                    Text(time, style: AppStyle.nunitoRegular14Gray),
                  ],
                ),
              5.verticalSpace,
              if (isSentByMe)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(sender, style: AppStyle.nunitoMedium15Black),
                        8.horizontalSpace,
                        Text(time, style: AppStyle.nunitoRegular14Gray),
                      ],
                    ),
                    5.horizontalSpace,
                    AssetImageWidget(
                      path: Assets.assetsIconsMale4Icon,
                      height: 40.w,
                      width: 40.w,
                    ),
                  ],
                ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isSentByMe ? Colors.blue : Colors.grey[200],
                  borderRadius: isSentByMe
                      ? BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(1),
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        )
                      : BorderRadius.only(
                          topLeft: Radius.circular(1),
                          topRight: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                        ),
                ),
                child: Text(
                  message,
                  style: isSentByMe
                      ? AppStyle.nunitoRegular15White
                      : AppStyle.nunitoRegular15Black,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
