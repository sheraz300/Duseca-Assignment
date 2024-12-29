import 'package:duseca_assignment/src/core/shared_widgets/asset_image_widget.dart';
import 'package:duseca_assignment/src/core/shared_widgets/custom_app_bar.dart';
import 'package:duseca_assignment/src/core/shared_widgets/custom_container.dart';
import 'package:duseca_assignment/src/core/shared_widgets/custom_divider.dart';
import 'package:duseca_assignment/src/core/shared_widgets/text_widget.dart';
import 'package:duseca_assignment/src/features/chat/presentation/widgets/divider_widget.dart';
import 'package:duseca_assignment/src/features/chat/presentation/widgets/file_message_widget.dart';
import 'package:duseca_assignment/src/features/chat/presentation/widgets/image_message_widget.dart';
import 'package:duseca_assignment/src/features/chat/presentation/widgets/message_widget.dart';
import 'package:duseca_assignment/src/utils/constants/app_assets.dart';
import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  // ignore: unused_field
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showTitle: false,
        showLeading: true,
        leadingImagePath: Assets.assetsIconsMenuIcon,
        backgroundColor: kPrimaryColor,
        actions: [
          AssetImageWidget(
            path: Assets.assetsIconsSearchIcon,
            fit: BoxFit.contain,
          ),
          25.horizontalSpace,
          AssetImageWidget(
              path: Assets.assetsIconsSettingIcon, fit: BoxFit.contain),
          25.horizontalSpace,
          AssetImageWidget(
              path: Assets.assetsIconsNotificationIcon, fit: BoxFit.contain),
          25.horizontalSpace,
          CustomDivider(
            thickness: 1.5,
            color: kLightGrayColor,
            height: 35.h,
            isVertical: true,
          ),
          20.horizontalSpace,
          AssetImageWidget(
            path: Assets.assetsIconsMale4Icon,
            height: 45.h,
            width: 45.w,
            fit: BoxFit.contain,
          ),
          15.horizontalSpace,
        ],
        onMenuPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Container(
          color: kPrimaryColor,
          child: Column(
            children: [
              CustomDivider(
                color: kLightGrayColor,
              ),
              Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          context.pop();
                        },
                        child: AssetImageWidget(
                          path: Assets.assetsIconsLongArrowLeftIcon,
                          fit: BoxFit.contain,
                          height: 10.h,
                          width: 20.w,
                        ),
                      ),
                      10.horizontalSpace,
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: const TextWidget("DT",
                            style: AppStyle.nunitoBold18White),
                      ),
                      12.horizontalSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              "Design Team",
                              style: AppStyle.nunitoRegular15Black,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "6 Members, 3 Online",
                              style: AppStyle.nunitoRegular15DarkGray,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 40.w,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(232, 234, 237, 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: AssetImageWidget(
                              color: kBlackColor,
                              path: Assets.assetsIconsMoreIcon),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomDivider(
                color: kLightGrayColor,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomContainer(
                  width: 400.w,
                  height: 1140.h,
                  backgroundColor: kPrimaryColor,
                  margin: EdgeInsets.only(bottom: 5),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(16.0),
                    children: [
                      messageWidget(
                        sender: "Jane Wilson",
                        message:
                            "Hi Jacob and Brandon, any progress on the project? 😅",
                        time: "10:43",
                        isSentByMe: false,
                        senderAvatarColor: Colors.orange,
                      ),
                      messageWidget(
                        sender: "Jacob Hawkins",
                        message:
                            "Hi Jane! 👋\nYes. I just finished developing the Chat template.",
                        time: "10:47",
                        isSentByMe: true,
                      ),
                      imageMessageWidget([
                        Assets.assetsImagesWallpaperImage,
                        Assets.assetsImagesWallpaperImage,
                        Assets.assetsImagesWallpaperImage
                      ], time: "10:47"),
                      messageWidget(
                        sender: "Brandon Pena",
                        message:
                            "Hi Jane! I’ve completed 16 of 20 problems so far.\n\nToday or tomorrow\nI think I’ll finish it 💪",
                        time: "10:52",
                        isSentByMe: false,
                        senderAvatarColor: Colors.green,
                      ),
                      20.verticalSpace,
                      dividerWidget("Today, 10 June"),
                      20.verticalSpace,
                      messageWidget(
                        sender: "Jane Wilson",
                        message:
                            "It looks amazing. The customer will be very satisfied. 😍",
                        time: "09:15",
                        isSentByMe: false,
                        senderAvatarColor: Colors.orange,
                      ),
                      messageWidget(
                        sender: "Jacob Hawkins",
                        message: "@Brandon, can you send me the Style Guide.",
                        time: "11:48",
                        isSentByMe: true,
                      ),
                      fileMessageWidget(
                        sender: "Brandon Pena",
                        fileName: "Brand Styles Guide",
                        fileSize: "570 KB",
                        time: "11:50",
                        senderAvatarColor: Colors.green,
                      ),
                      20.verticalSpace,
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          border: Border.all(
                            color: kLightGrayColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            AssetImageWidget(
                              path: Assets.assetsIconsMale4Icon,
                              width: 40.w,
                              height: 40.h,
                            ),
                            12.horizontalSpace,
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Type a message...',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              height: 40.w,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(245, 247, 250, 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: AssetImageWidget(
                                    path: Assets.assetsIconsSendIcon),
                              ),
                            ),
                          ],
                        ),
                      ),
                      10.verticalSpace,
                      Row(
                        children: [
                          Container(
                            height: 40.w,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(245, 247, 250, 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: AssetImageWidget(
                                  path: Assets.assetsIconsSmileIcon),
                            ),
                          ),
                          8.horizontalSpace,
                          Container(
                            height: 40.w,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(245, 247, 250, 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: AssetImageWidget(
                                  path: Assets.assetsIconsAttachmentIcon),
                            ),
                          ),
                          8.horizontalSpace,
                          Container(
                            height: 40.w,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(245, 247, 250, 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: AssetImageWidget(
                                  path: Assets.assetsIconsImageIcon),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
