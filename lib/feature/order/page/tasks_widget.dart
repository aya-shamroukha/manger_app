// ignore_for_file: library_private_types_in_public_api

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manger_app/core/resources/app_assets.dart';
import 'package:manger_app/core/resources/app_color.dart';
import 'package:manger_app/core/resources/app_string.dart';

class Task {
  final String id;
  final String name;
  String status;

  Task({required this.id, required this.name, required this.status});
}

class TaskWidget extends StatelessWidget {
  final Task task;

  const TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Draggable<Task>(
      data: task,
      feedback: TaskCard(task: task),
      childWhenDragging: Container(),
      child: TaskCard(task: task),
    );
  }
}

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        width: 120.w,
        height: 130.h,
        decoration: BoxDecoration(
            color: task.status == 'Backing'
                ? AppColor.purpleCard
                : task.status == 'on progress'
                    ? AppColor.redCard
                    : AppColor.greenCard,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    task.status == 'Backing'
                        ? AppStrings.backing.tr()
                        : task.status == 'on progress'
                            ? AppStrings.onprogress.tr()
                            : AppStrings.done.tr(),
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: task.status == 'Backing'
                            ? AppColor.labelcolor
                            : task.status == 'on progress'
                                ? AppColor.red
                                : Colors.green,
                        fontSize: 16),
                  ),
                  Image.asset(
                    AppAssets.bug,
                    width: 18.w,
                    fit: BoxFit.cover,
                  )
                ],
              ),
              Container(
                width: 100.w,
                height: 90.h,
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'my task',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColumnWidget extends StatelessWidget {
  final String status;
  final List<Task> tasks;
  final Function(Task, String) onTaskMoved;

  const ColumnWidget(
      {super.key,
      required this.status,
      required this.tasks,
      required this.onTaskMoved});

  @override
  Widget build(BuildContext context) {
    return DragTarget<Task>(
      onAccept: (task) {
        onTaskMoved(task, status);
      },
      builder: (context, candidateData, rejectedData) {
        return Column(
          children: [
            ...tasks.map((task) => TaskWidget(task: task)),
          ],
        );
      },
    );
  }
}

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key});

  @override
  _TasksWidgetState createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  List<Task> tasks = [
    Task(id: '1', name: AppStrings.backing.tr(), status: 'Backing'),
    // Task(id: '2', name: AppStrings.onprogress.tr(), status: 'on progress'),
    // Task(id: '3', name: AppStrings.done.tr(), status: 'Done'),
  ];

  void moveTask(Task task, String newStatus) {
    setState(() {
      task.status = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: ColumnWidget(
              status: 'Backing',
              tasks: tasks.where((task) => task.status == 'Backing').toList(),
              onTaskMoved: moveTask,
            ),
          ),
          Expanded(
            child: ColumnWidget(
              status: 'on progress',
              tasks:
                  tasks.where((task) => task.status == 'on progress').toList(),
              onTaskMoved: moveTask,
            ),
          ),
          Expanded(
            child: ColumnWidget(
              status: 'Done',
              tasks: tasks.where((task) => task.status == 'Done').toList(),
              onTaskMoved: moveTask,
            ),
          ),
        ],
      ),
    );
  }
}
