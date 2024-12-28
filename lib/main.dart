import 'package:duseca_assignment/src/core/config/app_router.dart';
import 'package:duseca_assignment/src/utils/style/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      enableScaleText: () => true,
      enableScaleWH: () => true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: AppString.projectName,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
