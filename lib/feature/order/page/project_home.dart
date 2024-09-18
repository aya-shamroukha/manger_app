import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manger_app/core/resources/app_color.dart';
import 'package:manger_app/core/resources/app_string.dart';
import 'package:manger_app/feature/order/page/drawer_page.dart';
import 'package:manger_app/feature/order/page/tasks_widget.dart';
import 'package:manger_app/feature/order/page/widget/popup.dart';
import 'package:manger_app/feature/shares/custom_sizedbox.dart';
import 'package:readmore/readmore.dart';

class ProjectHome extends StatelessWidget {
  ProjectHome({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: AppColor.background,
          width: 218.w,
          child: const DrawerPage(),
        ),
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox_Height(height: 36.h),
              Center(
                child: Container(
                  width: 342.w,
                  height: 51.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.secondary),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                          icon: const Icon(
                            Icons.dehaze,
                            color: AppColor.labelcolor,
                          )),
                      Text(
                        AppStrings.projectname.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontSize: 20.sp),
                      ),
                      const PopUpProject(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
                child: Expanded(
                  child: Container(
                    // width: 316.w,
                    // height: 400.h,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColor.buttonColor),
                    child: ReadMoreText(
                      AppStrings.readmoretext.tr(),
                      trimMode: TrimMode.Line,
                      style: TextStyle(
                          color: AppColor.labelcolor, fontSize: 15.sp),
                      trimLines: 4,
                      colorClickableText: AppColor.lightblue,
                      trimCollapsedText: AppStrings.showmore.tr(),
                      trimExpandedText: '...${AppStrings.showless.tr()}',
                      moreStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.lightblue),
                    ),
                  ),
                ),
              ),
              // SizedBox_Height(height: 20.h),
              SizedBox(
                  height: 370.h,
                  width: double.infinity,
                  child: const TasksWidget())
            ],
          ),
        ),
      ),
    );
  }
}
