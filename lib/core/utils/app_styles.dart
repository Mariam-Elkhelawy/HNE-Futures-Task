import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hne_futures_task/core/utils/app_colors.dart';

class AppStyles {

  static TextStyle bodySmall = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.primaryColor,
  );

  static TextStyle titleAppBar = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.whiteColor,
  );

}
