import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:perfume_app/contants/colors.dart';
import 'package:perfume_app/contants/constants.dart';
import 'package:perfume_app/contants/styles.dart';

AppBar buildAppbar(BuildContext context) {
  return AppBar(
    toolbarHeight: MediaQuery.of(context).size.height * 0.15,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    title: Column(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: const TextSpan(
                text: 'Welcome, ',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff2C2C2C),
                ),
                children: [
                  TextSpan(
                    text: 'James!',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Color(0xff2C2C2C),
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(AppAssets.notificationIcon),
          ],
        ),
        Row(
          spacing: 10,
          children: [
            Expanded(
              flex: 2,
              child: SearchBar(
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                constraints: const BoxConstraints(minHeight: 20),
                elevation: const WidgetStatePropertyAll(0),
                hintText: 'Search..',
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(30),
                    side: const BorderSide(color: Color(0xffEDEDED)),
                  ),
                ),
                leading: SvgPicture.asset(AppAssets.searchIcon),
                hintStyle: WidgetStatePropertyAll(
                  AppStyles.viewAllTextStyle(color: AppColors.greyTextColor),
                ),
                backgroundColor: const WidgetStatePropertyAll(Colors.white),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(5),
                  minimumSize: Size(30, 34),
                  elevation: 0,
                  backgroundColor: AppColors.redColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: 5,
                  children: [
                    Text(
                      'Scan Here',
                      style: AppStyles.fs13fw600(
                        color: AppColors.whiteTextColor,
                      ),
                    ),
                    Image.asset(AppAssets.barcodeIcon, height: 24, width: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
