import 'package:duseca_assignment/src/core/shared_widgets/text_widget.dart';
import 'package:duseca_assignment/src/utils/style/app_color.dart';
import 'package:duseca_assignment/src/utils/style/app_style.dart';
import 'package:flutter/material.dart';

class ECommercePage extends StatelessWidget {
  const ECommercePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: TextWidget(
          'E-Commerce Page Under Development',
          style: AppStyle.nunitoBold15Black,
        ),
      ),
    );
  }
}
