import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manger_app/core/resources/app_color.dart';
import 'package:manger_app/core/resources/app_string.dart';

class PopUpProject extends StatelessWidget {
  const PopUpProject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PopupMenuButton(
          child: const Icon(
            Icons.hdr_strong,
            color: AppColor.labelcolor,
          ),
          itemBuilder: (context) => [
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete_outline,
                        color: AppColor.grey2,
                      ),
                      Text(
                        AppStrings.delete.tr(),
                        style: TextStyle(color: AppColor.grey2),
                      )
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit_note_sharp,
                        color: AppColor.grey2,
                      ),
                      Text(
                        AppStrings.edit.tr(),
                        style: TextStyle(color: AppColor.grey2),
                      )
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.copy,
                        color: AppColor.grey2,
                      ),
                      Text(
                        AppStrings.copyid.tr(),
                        style: TextStyle(color: AppColor.grey2),
                      )
                    ],
                  ),
                )
              ]),
    );
  }
}
