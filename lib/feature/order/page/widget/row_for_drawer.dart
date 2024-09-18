import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manger_app/core/resources/app_color.dart';
import 'package:manger_app/feature/shares/custom_sizedbox.dart';

class RowForDrawer extends StatelessWidget {
  const RowForDrawer({
    super.key,
    required this.text,
    required this.image,
    this.ontap,
  });
  final String text;
  final String image;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: InkWell(
          onTap: ontap,
          child: Row(
            children: [
              SizedBox_width(
                width: 10.w,
              ),
              Image.asset(image),
              SizedBox_width(
                width: 10.w,
              ),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: AppColor.drawercolor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
