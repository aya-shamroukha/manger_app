// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manger_app/core/domin/model/project_model/add_task_for_project_model.dart';
import 'package:manger_app/core/resources/app_color.dart';
import 'package:manger_app/core/resources/app_string.dart';
import 'package:manger_app/feature/order/bloc/add_new_task/add_new_task_bloc.dart';
import 'package:manger_app/feature/order/bloc/add_new_task/add_new_task_event.dart';
import 'package:manger_app/feature/shares/custom_buttom.dart';
import 'package:manger_app/feature/shares/custom_loading_button.dart';
import 'package:manger_app/feature/shares/custom_sizedbox.dart';
import 'package:manger_app/feature/shares/custom_white_textfield.dart';

import '../../../core/resources/app_assets.dart';
import '../bloc/add_new_task/add_new_task_state.dart';

// ignore: must_be_immutable
class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});
  String temp = '';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNewTaskBloc(),
      child: BlocBuilder<AddNewTaskBloc, AddNewTaskState>(
        builder: (context, state) {
          var addtask = BlocProvider.of<AddNewTaskBloc>(context);
          print(addtask.tasks.length);
          return SafeArea(
            child: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 75.w,
                      height: 54.h,
                      child: Image.asset(AppAssets.osscam)),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      AppStrings.tasks.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox_Height(height: 43.h),
                  Expanded(
                      child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox_Height(height: 25.h);
                          },
                          itemCount: addtask.tasks.length,
                          itemBuilder: ((context, index) {
                            return Dismissible(
                              direction: DismissDirection.startToEnd,
                              key: Key(index.toString()),
                              background: Container(
                                color: AppColor.red.withOpacity(0.8),
                                child: Row(
                                  children: [
                                    SizedBox_width(width: 10.w),
                                    const Icon(
                                      Icons.delete,
                                      color: AppColor.white,
                                      size: 25,
                                    ),
                                  ],
                                ),
                              ),
                              onDismissed: (DismissDirection direction) {
                                // context
                                //     .read<AddNewTaskBloc>()
                                //     .add(DismissibleTask(index: index));
                                print('$index');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 234.w,
                                    height: 70.h,
                                    decoration: BoxDecoration(
                                        color: AppColor.purpleCard,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 15.h,
                                          right: 9.w,
                                          left: 9.2,
                                          bottom: 4.h),
                                      width: 215.w,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                          color: AppColor.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: WhiteTextField(
                                          controller:
                                              (addtask.tasks.length - 1 ==
                                                      index)
                                                  ? addtask.taskDescription
                                                  : null),
                                    ),
                                  ),
                                  index == 0
                                      ? IconButton(
                                          onPressed: () {
                                            if (addtask.taskDescription.text ==
                                                    '' ||
                                                addtask.taskDescription.text ==
                                                    null) {
                                              // context
                                              //     .read<AddNewTaskBloc>()
                                              //     .add(AddContainerForTask());
                                              //    addtask.taskDescription.clear();
                                            } else {
                                              temp =
                                                  addtask.taskDescription.text;

                                              // context
                                              //     .read<AddNewTaskBloc>()
                                              //     .add(
                                              //       SubmitOneTask(
                                              //         oneTask: AddNewTaskModel(
                                              //             taskDescription: addtask
                                              //                 .taskDescription
                                              //                 .text,
                                              //             taskStatus: 'NEW',
                                              //             project_id: 3902),
                                              //       ),
                                              // );

                                              // context
                                              //     .read<AddNewTaskBloc>()
                                              //     .add(AddContainerForTask());
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.add_circle,
                                            color: AppColor.white,
                                            size: 35,
                                          ))
                                      : SizedBox_width(width: 45.w)
                                ],
                              ),
                            );
                          }))),
                  SizedBox_Height(height: 25.h),
                  addtask.tasks.isEmpty
                      ? Positioned(
                          bottom: 0,
                          child: Center(
                            child: FloatingActionButton(
                              shape: const CircleBorder(),
                              backgroundColor: AppColor.white,
                              child: const Icon(
                                Icons.add,
                                size: 35,
                              ),
                              onPressed: () {
                                if (addtask.taskDescription.text == '' ||
                                    addtask.taskDescription.text == null) {
                                  context
                                      .read<AddNewTaskBloc>()
                                      .add(AddContainerForTask());
                                  addtask.taskDescription.clear();
                                } else {
                                  temp = addtask.taskDescription.text;

                                  context.read<AddNewTaskBloc>().add(
                                        SubmitOneTask(
                                          oneTask: AddNewTaskModel(
                                              taskDescription:
                                                  addtask.taskDescription.text,
                                              taskStatus: 'NEW',
                                              project_id: 3902),
                                        ),
                                      );

                                  context
                                      .read<AddNewTaskBloc>()
                                      .add(AddContainerForTask());
                                  //    addtask.taskDescription.clear();
                                }
                              },
                            ),
                          ))
                      : state is AddNewTaskLoadingState
                          ? const Loading()
                          : Center(
                              child: CustomButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('ProjectHome');
//                                   context
//                                       .read<AddNewTaskBloc>()
//                                       .add(AddNewTaskSuccessEvent(
// //                                 addNewTaskModel:[
// // AddNewTaskModel(taskDescription: addtask.taskDescription.text,
// //                                  project_id:    getIt.get<SharedPreferences>().getInt('id',))

// //                                 ]

//                                           ));
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
          );
        },
      ),
    );
  }
}
