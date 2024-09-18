import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manger_app/core/resources/app_assets.dart';
import 'package:manger_app/core/resources/app_color.dart';
import 'package:manger_app/core/resources/app_string.dart';
import 'package:manger_app/feature/order/page/widget/row_for_drawer.dart';
import 'package:manger_app/feature/shares/custom_sizedbox.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox_Height(
          height: 32.h,
        ),
        Image.asset(
          AppAssets.logoForAuth,
          width: 90,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 19),
          child: Text(
            'username',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const Divider(
          thickness: 1,
          color: AppColor.drawercolor,
        ),
        SizedBox_Height(height: 31.h),
        RowForDrawer(
          text: AppStrings.createJoin.tr(),
          image: AppAssets.link,
        ),
        RowForDrawer(
          text: AppStrings.changelan.tr(),
          image: AppAssets.arabic,
          ontap: () {
            if (context.locale.languageCode == "ar") {
              context.setLocale(const Locale("en"));
            } else {
              context.setLocale(const Locale("ar"));
            }
          },
        ),
        RowForDrawer(
          text: AppStrings.logout.tr(),
          image: AppAssets.logout,
        ),
        SizedBox_Height(height: 25.h),
        const Divider(
          thickness: 1,
          color: AppColor.drawercolor,
        ),
      ],
    );
  }
}
