import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hne_futures_task/core/utils/app_colors.dart';
import 'package:hne_futures_task/core/utils/app_images.dart';
import 'package:hne_futures_task/core/utils/app_strings.dart';
import 'package:hne_futures_task/core/utils/app_styles.dart';

class GoldWidget extends StatelessWidget {
  const GoldWidget({super.key, required this.goldType, required this.price});
  final String goldType;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.secondaryColor,
      shadowColor: Colors.transparent,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: AppColor.primaryColor.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColor.secondaryColor,
              radius: 24.r,
              child: Image.asset(AppImages.gold),
            ),
            title: Text(
              '$goldType ${AppStrings.gold}',
              style: AppStyles.bodyLarge,
            ),
            subtitle: Text(
              '${AppStrings.priceCapital} ${price.toStringAsFixed(2)} ${AppStrings.eg}',
            ),
          ),
        ),
      ),
    );
  }
}
