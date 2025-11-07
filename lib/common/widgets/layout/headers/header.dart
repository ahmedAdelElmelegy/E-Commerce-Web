import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/shimmers/shimmer.dart';
import 'package:yt_ecommerce_admin_panel/data/repo/user/user_repository.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/controller/user_controller.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/device/device_utility.dart';

class THeader extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const THeader({super.key, this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    Get.put(UserRepository());
    final controller = UserController.instance;
    debugPrint(controller.user.value.fullName);
    return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.md, vertical: TSizes.sm),
        decoration: const BoxDecoration(
          color: TColors.white,
          border: Border(bottom: BorderSide(color: TColors.grey, width: 1)),
        ),
        child: AppBar(
          // mobile menu
          leading: !TDeviceUtils.isDesktopScreen(context)
              ? IconButton(
                  onPressed: () {
                    scaffoldKey?.currentState?.openDrawer();
                  },
                  icon: const Icon(Iconsax.menu))
              : null,

          // search
          title: SizedBox(
            width: 400,
            child: TDeviceUtils.isDesktopScreen(context)
                ? TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.search_normal),
                        hintText: 'Search anything...',
                        border: OutlineInputBorder()),
                  )
                : null,
          ),
          actions: [
            // search icon
            if (!TDeviceUtils.isDesktopScreen(context))
              IconButton(
                  onPressed: () {}, icon: const Icon(Iconsax.search_normal)),

            // notification icon
            IconButton(
                onPressed: () {}, icon: const Icon(Iconsax.notification)),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            // user Data
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => TRoundedImage(
                      imageType: controller.user.value.profilePicture.isNotEmpty
                          ? ImageType.network
                          : ImageType.asset,
                      image: controller.user.value.profilePicture.isNotEmpty
                          ? controller.user.value.profilePicture
                          : TImages.user,
                      width: 40,
                      padding: 2,
                      height: 40,
                      fit: BoxFit.cover),
                ),
                const SizedBox(width: TSizes.sm),
                if (!TDeviceUtils.isMobileScreen(context))
                  Obx(
                    () => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.loading.value
                            ? const TShimmerEffect(width: 50, height: 13)
                            : Text(
                                controller.user.value.fullName,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                        controller.loading.value
                            ? const TShimmerEffect(width: 50, height: 13)
                            : Text(
                                controller.user.value.email,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                      ],
                    ),
                  )
              ],
            )
          ],
        ));
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(TDeviceUtils.getAppBarHeight() + 15);
}
