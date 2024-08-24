import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hne_futures_task/core/utils/app_colors.dart';
import 'package:hne_futures_task/core/utils/app_strings.dart';
import 'package:hne_futures_task/core/utils/app_styles.dart';
import 'package:line_icons/line_icons.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.index, required this.onTabChange});
  final int index;
  final void Function(int)? onTabChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 40.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.r),
        child: GNav(
          selectedIndex: index,
          onTabChange: onTabChange,
          backgroundColor: AppColor.primaryColor,
          tabMargin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          rippleColor: AppColor.primaryColor,
          haptic: true,
          tabBorderRadius: 15,
          tabShadow: [
            BoxShadow(
                color: AppColor.primaryColor.withOpacity(0.5), blurRadius: 8)
          ],
          curve: Curves.decelerate,
          duration: const Duration(milliseconds: 600),
          color: AppColor.secondaryColor,
          activeColor: AppColor.primaryColor,
          iconSize: 24,
          gap: 8.w,
          tabBackgroundGradient: LinearGradient(
            colors: [
              AppColor.secondaryColor.withOpacity(.5),
              AppColor.secondaryColor
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          textStyle: AppStyles.bodySmall,
          tabs: const [
            GButton(
              icon: LineIcons.wavyMoneyBill,
              text: AppStrings.currency,
            ),
            GButton(
              icon: LineIcons.coins,
              text: AppStrings.gold,
            ),

          ],
        ),
      ),
    );
  }
}
