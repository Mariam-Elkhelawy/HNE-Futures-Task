import 'package:flutter/material.dart';
import 'package:hne_futures_task/core/utils/app_colors.dart';
import 'package:hne_futures_task/core/utils/app_strings.dart';
import 'package:hne_futures_task/core/utils/app_styles.dart';
import 'package:hne_futures_task/features/home/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int navIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.hne,
          style: AppStyles.titleAppBar,
        ),
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
      ),
      bottomNavigationBar: NavBar(
        index: navIndex,
        onTabChange: (p0) {},
      ),
    );
  }
}
