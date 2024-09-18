import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manger_app/core/config/local_storage/shared_preferences.dart';
import 'package:manger_app/core/domin/model/project_model/add_new_project.dart';
import 'package:manger_app/core/resources/app_assets.dart';
import 'package:manger_app/core/resources/app_color.dart';
import 'package:manger_app/core/resources/app_string.dart';
import 'package:manger_app/feature/order/bloc/add_new_project_bloc/add_new_project_bloc.dart';
import 'package:manger_app/feature/order/bloc/add_new_project_bloc/add_new_project_event.dart';
import 'package:manger_app/feature/order/bloc/add_new_project_bloc/add_new_project_state.dart';
import 'package:manger_app/feature/shares/custom_buttom.dart';
import 'package:manger_app/feature/shares/custom_loading_button.dart';
import 'package:manger_app/feature/shares/custom_sizedbox.dart';
import 'package:manger_app/feature/shares/custom_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shares/custom_white_textfield.dart';

class AddNewProjectScreen extends StatelessWidget {
  const AddNewProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNewProjectBloc(),
      child: BlocConsumer<AddNewProjectBloc, AddNewProjectState>(
        listener: (context, state) {
          //if(state is AddNewProjectSuccessState ){
//                        print(state.projectId);
//                              getIt.get<SharedPreferences>().setInt(
//           'id',state.projectId);
//     showTost(message: AppStrings.creatSucessfully.tr(), state: ToastState.success);
//  Navigator.of(context).pushNamed('tasksScreen');                  }
//                   else if( state is AddNewProjectErrorState){
//                     print('--------------- faild');
//     showTost(message: AppStrings.failed.tr(), state: ToastState.error);
//                   }
        },
        builder: (context, state) {
          var addproject = BlocProvider.of<AddNewProjectBloc>(context);

          return Scaffold(
            body: SafeArea(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 75.w,
                            height: 54.h,
                            child: Image.asset(AppAssets.osscam)),
                        Text(
                          AppStrings.projectname.tr(),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        SizedBox_Height(height: 16.h),
                        SizedBox(
                            width: 310.w,
                            child: WhiteTextField(
                              controller: addproject.projectname,
                            )),
                        SizedBox_Height(height: 27.h),
                        Text(
                          AppStrings.projectscript.tr(),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        SizedBox_Height(height: 16.h),
                        Container(
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(15)),
                            width: 310.w,
                            height: 320.h,
                            child: WhiteTextField(
                              maxlens: 8,
                              controller: addproject.projectDescription,
                            )),
                        SizedBox_Height(height: 26.h),
                        state is AddNewProjectLoadingState
                            ? const Loading()
                            : Center(
                                child: CustomButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed('tasksScreen');
                                    // context.read<AddNewProjectBloc>().add(AddNewProjectSuccessEvent(
                                    //   addNewProjectModel: AddNewProjectModel(
                                    //     projectDescription: addproject.projectDescription.text.toString(),
                                    //     projectName: addproject.projectname.text.toString(),
                                    // projectStatus: 'NEW'
                                    // )));
                                    // if( state is AddNewProjectSuccessState){

                                    // }
                                  },
                                  text: AppStrings.create.tr(),
                                  width: 283.w,
                                  height: 39.h,
                                ),
                              ),
                        SizedBox_Height(height: 35.h)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
