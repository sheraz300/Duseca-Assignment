import 'package:duseca_assignment/src/core/shared_widgets/asset_image_widget.dart';
import 'package:duseca_assignment/src/core/shared_widgets/custom_app_bar.dart';
import 'package:duseca_assignment/src/core/shared_widgets/custom_divider.dart';
import 'package:duseca_assignment/src/core/shared_widgets/text_widget.dart';
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
  late AnimationController _animationController;
  final double _drawerWidth = 250;
  bool _isDrawerOpen = false;

  final int _selectedIndex = 0;

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
      if (_isDrawerOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

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
    return SafeArea(
      child: Scaffold(
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
          onMenuPressed: _toggleDrawer,
        ),
        body: Column(
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
                  ],
                ),
              ),
            ),
            CustomDivider(
              color: kLightGrayColor,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  _buildMessage(
                    sender: "Jane Wilson",
                    message:
                        "Hi Jacob and Brandon, any progress on the project? 😅",
                    time: "10:43",
                    isSentByMe: false,
                    senderAvatarColor: Colors.orange,
                  ),
                  _buildMessage(
                    sender: "Jacob Hawkins",
                    message:
                        "Hi Jane! 👋\nYes. I just finished developing the Chat template.",
                    time: "10:47",
                    isSentByMe: true,
                  ),
                  _buildImageMessage(["image1", "image2", "image3"],
                      time: "10:47"),
                  _buildMessage(
                    sender: "Brandon Pena",
                    message:
                        "Hi Jane! I’ve completed 16 of 20 problems so far.\n\nToday or tomorrow\nI think I’ll finish it 💪",
                    time: "10:52",
                    isSentByMe: false,
                    senderAvatarColor: Colors.green,
                  ),
                  _buildDivider("Today, 10 June"),
                  _buildMessage(
                    sender: "Jane Wilson",
                    message:
                        "It looks amazing. The customer will be very satisfied. 😍",
                    time: "09:15",
                    isSentByMe: false,
                    senderAvatarColor: Colors.orange,
                  ),
                  _buildMessage(
                    sender: "Jacob Hawkins",
                    message: "@Brandon, can you send me the Style Guide.",
                    time: "11:48",
                    isSentByMe: true,
                  ),
                  _buildFileMessage(
                    sender: "Brandon Pena",
                    fileName: "Brand Styles Guide",
                    fileSize: "570 KB",
                    time: "11:50",
                    senderAvatarColor: Colors.green,
                  ),
                ],
              ),
            ),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage({
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
            CircleAvatar(
              backgroundColor: senderAvatarColor,
              child: Text(sender[0], style: TextStyle(color: Colors.white)),
            ),
          if (!isSentByMe) SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: isSentByMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                if (!isSentByMe)
                  Text(sender, style: TextStyle(fontWeight: FontWeight.bold)),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSentByMe ? Colors.blue : Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    message,
                    style: TextStyle(
                        color: isSentByMe ? Colors.white : Colors.black),
                  ),
                ),
                SizedBox(height: 5),
                Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageMessage(List<String> imageUrls, {required String time}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Wrap(
            spacing: 8.0,
            children: imageUrls.map((url) {
              return Container(
                height: 80,
                width: 80,
                color: Colors.grey[300], // Placeholder for images
              );
            }).toList(),
          ),
          SizedBox(width: 8),
          Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildDivider(String text) {
    return Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(text, style: TextStyle(color: Colors.grey)),
        ),
        Expanded(child: Divider()),
      ],
    );
  }

  Widget _buildFileMessage({
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
          CircleAvatar(
            backgroundColor: senderAvatarColor,
            child: Text(sender[0], style: TextStyle(color: Colors.white)),
          ),
          SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.insert_drive_file, color: Colors.orange),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(fileName,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(fileSize, style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.download, color: Colors.grey),
                ],
              ),
            ),
          ),
          SizedBox(width: 8),
          Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: Colors.white,
      child: Row(
        children: [
          Icon(Icons.add, color: Colors.grey),
          SizedBox(width: 16),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type a message...",
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.send, color: Colors.blue),
        ],
      ),
    );
  }
}
