import 'package:duseca_assignment/src/core/shared_widgets/text_widget.dart';
import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatTile extends StatefulWidget {
  final Widget leading;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const ChatTile({
    required this.leading,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
    super.key,
  });

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: kChatTileColor,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          hoverColor: kWhiteColor,
          highlightColor: kWhiteColor,
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(14.0),
          splashColor: kWhiteColor,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                widget.leading,
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        widget.title,
                        style: AppStyle.nunitoRegular15Black,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.subtitle,
                        style: AppStyle.nunitoRegular15DarkGray,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                if (widget.trailing != null) widget.trailing!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
