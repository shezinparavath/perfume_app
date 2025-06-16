import 'package:flutter/widgets.dart';
import 'package:perfume_app/contants/colors.dart';

class AppStyles {
  static TextStyle headerTextStyle({Color? color}) => TextStyle(
    color: color ?? AppColors.primaryBlackTextColor,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  static TextStyle viewAllTextStyle({Color? color, bool underLine = false}) =>
      TextStyle(
        color: color ?? AppColors.primaryBlackTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,decorationColor: color??AppColors.primaryBlackTextColor,
        decoration: underLine ? TextDecoration.underline : null,
      );

  static const TextStyle categoryTextStyle = TextStyle(
    color: AppColors.primaryBlackTextColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle fs13fw600({Color? color}) =>
      TextStyle(
        color: color ?? AppColors.primaryBlackTextColor,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      );

  static TextStyle fs11fw400({Color? color}) =>
      TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: color ?? AppColors.primaryBlackTextColor,
      );

  static const TextStyle fs10fw500 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.tertiaryBlackTextColor,
  );

  static const TextStyle addToCartTextstyle = TextStyle(
    color: AppColors.whiteTextColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle fs12fw600({Color? color, bool underline = false}) =>
      TextStyle(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w600,decorationColor: color??AppColors.primaryBlackTextColor,
        decoration:underline? TextDecoration.underline:null,
      );
}
