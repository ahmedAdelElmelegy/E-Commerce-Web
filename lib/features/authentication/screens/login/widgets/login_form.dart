import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/data/repo/user/user_repository.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/controller/login_controller.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/text_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(UserRepository());
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                label: Text(TTexts.email),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            Obx(
              () => TextFormField(
                obscureText: controller.hidePassword.value,
                controller: controller.password,
                validator: (value) =>
                    TValidator.validateEmptyText(value, 'Password'),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () {
                        controller.hidePassword.value =
                            !controller.hidePassword.value;
                      },
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye)),
                  label: const Text(TTexts.password),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections / 2),
            // remender me

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) {
                            controller.rememberMe.value = value!;
                          }),
                    ),
                    const Text(TTexts.rememberMe),
                  ],
                ),
                //  forget password
                TextButton(
                    onPressed: () {
                      Get.toNamed(TRoutes.forgetPassword);
                    },
                    child: const Text(TTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    controller.emailAndPasswordSignIn();
                  },
                  child: const Text(TTexts.signIn)),
            )
          ],
        ),
      ),
    );
  }
}
