import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manger_app/core/resources/app_assets.dart';
import 'package:manger_app/core/resources/app_color.dart';
import 'package:manger_app/core/resources/app_string.dart';
import 'package:manger_app/feature/shares/custom_buttom.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:manger_app/feature/shares/custom_sizedbox.dart';
class CreateProjectScreen extends StatelessWidget {
  const CreateProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
  
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Image.asset(AppAssets.osscam),
              CustomButton(onPressed: (){
                Navigator.of(context).pushNamed('addNewProjectScreen');
              }, text: AppStrings.create.tr(),width: 283.w,height: 39.h,),
              SizedBox_Height(height: 55.h),
              DottedBorder(
  borderType: BorderType.RRect,
  radius: const Radius.circular(12),
  padding: const EdgeInsets.all(6),
  dashPattern: const [20, 11],color: AppColor.white,
  strokeWidth: 1,
  child: ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    child:InkWell(
      onTap: (){
        showModalBottomSheet(context: context, builder: (context){

          return  Container(
            height: 360.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),
              ),
              color: AppColor.secondary
            ),child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(children: [
                    SizedBox_Height(height: 30.h),
                Row(
                  children: [
                    SizedBox(
                      width: 220.w,
                      child: Text('${AppStrings.enterprojectsID.tr()} ..',style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColor.primary),)),
                      Image.asset(AppAssets.tree)
                  ],
                ),
                SizedBox_Height(height: 30.h),
                SizedBox(
                  width: 271.w,
                  child: TextField(
                    decoration:  InputDecoration(
                      fillColor: AppColor.white,
                      filled: true,
                     focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: AppColor.white),borderRadius: BorderRadius.circular(10)),
                     enabledBorder:  OutlineInputBorder(borderSide: const BorderSide(color: AppColor.white),borderRadius: BorderRadius.circular(10))
                                
                    ),
                  ),
                ),
                 SizedBox_Height(height: 67.h),
                CustomButton(onPressed: (){}, text: AppStrings.confirm.tr(),width: 271.w,height: 39.h,
                textcolor: AppColor.white,
                background: AppColor.primary,)
              ],),
            ),
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 249.w,height: 30.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add_circle,color: AppColor.white,size: 35,),
              SizedBox_width(width: 10.w),
             Text(AppStrings.join.tr(),style: Theme.of(context).textTheme.displayMedium,),
            ],
          ),
        ),
      ),
    )
  ),
)
              
            ],
          ),
        ),
      ),
    );
  }
}
