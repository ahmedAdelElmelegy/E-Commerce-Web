import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/features/media/screens/widgets/media_content.dart';
import 'package:yt_ecommerce_admin_panel/features/media/screens/widgets/media_uploader.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screen/dashboard/widgets/dashboard_card.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class MediaDesktopScreen extends StatelessWidget {
  const MediaDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // heading
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //  breadcrumb trail
                const BreadcrumbsWithHeading(
                  heading: 'Media',
                  breadcrumbsScreen: [
                    TRoutes.login,
                    TRoutes.forgetPassword,
                    TRoutes.media,
                  ],
                ),

                SizedBox(
                  width: TSizes.buttonWidth * 1.5,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Iconsax.cloud_add),
                    label: const Text('Upload Images'),
                  ),
                )
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            // upload area
            const MediaUploader(),
            // Media
            const MediaContent(),
          ],
        ),
      ),
    ));
  }
}
