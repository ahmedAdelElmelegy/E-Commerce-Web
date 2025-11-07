import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/text_strings.dart';

class ResetPasswrodWidget extends StatelessWidget {
  const ResetPasswrodWidget({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () => Get.offAllNamed(TRoutes.login),
                icon: const Icon(CupertinoIcons.clear)),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Image.asset(
          TImages.deliveredEmailIllustration,
          height: 300,
          width: 300,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Text(
          TTexts.changeYourPasswordTitle,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Text(
          email,
          style: Theme.of(context).textTheme.labelLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Text(
          TTexts.changeYourPasswordSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        // btns
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.offAllNamed(TRoutes.login),
            child: const Text(TTexts.done),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            child: const Text(TTexts.resendEmail),
          ),
        ),
      ],
      // header
    );
  }
}
