import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/circular_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/t_circular_image.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layout/sidebars/menu/menu_item.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class TSideBar extends StatelessWidget {
  const TSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
            color: TColors.white,
            border: Border(right: BorderSide(color: TColors.grey, width: 1))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // image,
              const TCircularImage(
                  width: 100,
                  height: 100,
                  // imageType: ImageType.asset,
                  image: TImages.darkAppLogo),
              const SizedBox(height: TSizes.spaceBtwSections),
              Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Menu',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(letterSpacingDelta: 1.2),
                    ),
                    // const TMenuItem(
                    //     title: 'Dashboard',
                    //     icon: Iconsax.status,
                    //     route: TRoutes.dashboard),
                    // const TMenuItem(
                    //     title: 'Media',
                    //     icon: Iconsax.image,
                    //     route: TRoutes.categories),
                    const TMenuItem(
                        title: 'Banners',
                        icon: Iconsax.picture_frame,
                        route: TRoutes.firstScreen),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
