import 'package:duseca_assignment/src/core/config/app_routes.dart';
import 'package:duseca_assignment/src/core/shared_widgets/asset_image_widget.dart';
import 'package:duseca_assignment/src/core/shared_widgets/custom_divider.dart';
import 'package:duseca_assignment/src/core/shared_widgets/text_widget.dart';
import 'package:duseca_assignment/src/features/chat%20list/presentation/widgets/badge_widget.dart';
import 'package:duseca_assignment/src/features/chat%20list/presentation/widgets/chat_tile_widget.dart';
import 'package:duseca_assignment/src/utils/constants/app_assets.dart';
import 'package:duseca_assignment/src/utils/constants/constants.dart';
import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const TextField(
                  style: AppStyle.nunitoBold15Black,
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: AppStyle.nunitoRegular15DarkGray,
                    border: InputBorder.none,
                    icon: AssetImageWidget(path: Assets.assetsIconsSearchIcon),
                  ),
                ),
              ),
            ),
            const CustomDivider(color: kLightGrayColor),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget("PINNED",
                      style: AppStyle.nunitoMedium15DarkGray),
                  8.verticalSpace,
                  ...pinnedChats.map((chat) {
                    return ChatTile(
                      leading: chat.avatar,
                      title: chat.title,
                      subtitle: chat.subtitle,
                      trailing: chat.badgeCount != null
                          ? CustomeBadge(count: chat.badgeCount!)
                          : null,
                      onTap: () {
                        context.push(AppRoutes.chat);
                        debugPrint("Tapped on ${chat.title}");
                      },
                    );
                  }),
                  16.verticalSpace,
                  const Text("ALL MESSAGES",
                      style: AppStyle.nunitoMedium15DarkGray),
                  8.verticalSpace,
                  ...allChats.map((chat) {
                    return ChatTile(
                      leading: chat.avatar,
                      title: chat.title,
                      subtitle: chat.subtitle,
                      onTap: () {
                        context.push(AppRoutes.chat);
                        debugPrint("Tapped on ${chat.title}");
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
