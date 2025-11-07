import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/styles/spacing_styles.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class LoginTemplate extends StatelessWidget {
  final Widget child;
  const LoginTemplate({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: 550,
            child: SingleChildScrollView(
                child: Container(
              padding: TSpacingStyle.paddingWithAppBarHeight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    TSizes.cardRadiusLg,
                  ),
                  color: TColors.white),
              child: child,
            ))));
  }
}
