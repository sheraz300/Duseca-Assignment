import 'package:duseca_assignment/src/core/shared_widgets/asset_image_widget.dart';
import 'package:duseca_assignment/src/core/shared_widgets/custom_app_bar.dart';
import 'package:duseca_assignment/src/core/shared_widgets/custom_divider.dart';
import 'package:duseca_assignment/src/core/shared_widgets/custom_drawer.dart';
import 'package:duseca_assignment/src/features/calendar/presentation/calendar_page.dart';
import 'package:duseca_assignment/src/features/chat%20list/presentation/chat_list_page.dart';
import 'package:duseca_assignment/src/features/contacts/presentation/contact_page.dart';
import 'package:duseca_assignment/src/features/eCommerce/presentation/e_commerce_page.dart';
import 'package:duseca_assignment/src/features/file%20manager/presentation/file_manager_page.dart';
import 'package:duseca_assignment/src/features/mail/presentation/mail_page.dart';
import 'package:duseca_assignment/src/features/notes/presentation/note_page.dart';
import 'package:duseca_assignment/src/features/overview/presentation/overview_page.dart';
import 'package:duseca_assignment/src/features/projects/presentation/project_page.dart';
import 'package:duseca_assignment/src/features/tasks/presentation/task_page.dart';
import 'package:duseca_assignment/src/utils/constants/app_assets.dart';
import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final double _drawerWidth = 250;
  bool _isDrawerOpen = false;

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    OverviewPage(),
    ECommercePage(),
    CalendarPage(),
    MailPage(),
    ChatListPage(),
    TaskPage(),
    ProjectPage(),
    FileManagerPage(),
    NotePage(),
    ContactPage()
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

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

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
      _toggleDrawer();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CustomDrawer(
              selectedIndex: _selectedIndex,
              onItemSelected: _onItemSelected,
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                double slide = _drawerWidth * _animationController.value;
                return Transform(
                  transform: Matrix4.identity()..translate(slide),
                  child: GestureDetector(
                    onTap: _isDrawerOpen ? _toggleDrawer : null,
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
                              path: Assets.assetsIconsSettingIcon,
                              fit: BoxFit.contain),
                          25.horizontalSpace,
                          AssetImageWidget(
                              path: Assets.assetsIconsNotificationIcon,
                              fit: BoxFit.contain),
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
                      body: _screens[_selectedIndex],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
