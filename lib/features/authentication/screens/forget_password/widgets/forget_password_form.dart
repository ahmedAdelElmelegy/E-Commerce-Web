import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/text_strings.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(children: [
      TextFormField(
        decoration: const InputDecoration(
            label: Text(TTexts.email), prefixIcon: Icon(Iconsax.direct_right)),
      ),
      const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(TRoutes.resetPassword,
                parameters: {'email': 'some@gmail.com'});
          },
          child: const Text(TTexts.submit),
        ),
      )
    ]));
  }
}
