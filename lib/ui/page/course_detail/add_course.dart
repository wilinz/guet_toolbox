import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/course/semester_schedule.dart';
import 'package:guethub/ui/util/toast.dart';
import 'package:guethub/util/time.dart';
import 'package:kt_dart/kt.dart';
import 'add_course_vm.dart';

class AddCoursePage extends StatefulWidget {
  final SemesterSchedule semesterScheduleTemplate;

  AddCoursePage(this.semesterScheduleTemplate);

  @override
  State<AddCoursePage> createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(AddCourseController(widget.semesterScheduleTemplate));

    final isAdd = !widget.semesterScheduleTemplate.id.isNotBlank;

    return PopScope(
      canPop: false,
      onPopInvoked: (bool shouldPop) async {
        if (!shouldPop) {
          if (!controller.isHasChange()) {
            Navigator.of(context).pop();
            return;
          }
          int? flag = await showDialog<int>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('确认退出'),
              content: Text('您还未保存更改，确定要退出吗？，点击对话框外部可取消'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(0),
                  child: Text('直接退出'),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop(1);
                  },
                  child: Text('保存后退出'),
                ),
              ],
            ),
          );
          if (flag == 0) {
            Navigator.of(context).pop();
          } else if (flag == 1) {
            final data = await saveData(controller);
            if(data != null) {
              Navigator.of(context).pop(data);
            }
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(isAdd ? '添加课程' : '编辑课程'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: controller.formKey, // 将表单绑定到 GlobalKey
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                // 表单字段
                for (String key in controller.controllers.keys)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.disabled,
                      readOnly: controller.isReadOnly(key),
                      controller: controller.controllers[key],
                      keyboardType: controller.inputTypes[key],
                      decoration: InputDecoration(
                        labelText: controller.fieldLabels[key],
                        suffix: buildSuffix(key, context, controller),
                      ),
                      validator: (value) {
                        if (value == null) return null;
                        return controller.validateField(key, value);
                      },
                    ),
                  ),
                // 布尔字段（例如复选框）
                for (String key in controller.boolFields.keys)
                  Obx(() => CheckboxListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(controller.fieldLabels[key] ?? ''),
                        value: controller.boolFields[key]?.value,
                        onChanged: (value) {
                          controller.boolFields[key]?.value = value ?? false;
                        },
                      )),
                // 提交按钮
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 48),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final data = await saveData(controller);
                        if (data != null) {
                          Get.back(result: data);
                        }
                      },
                      child: Text(isAdd ? '添加课程' : '修改课程'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget? buildSuffix(
      String key, BuildContext context, AddCourseController controller) {
    if (key == FieldKeys.startTime || key == FieldKeys.endTime) {
      return IconButton(
        icon: Icon(Icons.access_time),
        onPressed: () async {
          // 检测当前字段并设置初始时间
          TimeOfDay initialTime = TimeOfDay.now();
          final currentText = controller.controllers[key]?.text;
          if (currentText != null && currentText.isNotEmpty) {
            final parsedTime = ExtendedTimeOfDay.tryParse(currentText);
            if (parsedTime != null) {
              initialTime = parsedTime;
            }
          }

          // 弹出时间选择对话框
          await showCustomTimePicker(
            context: context,
            initialTime: initialTime,
            onTimeSelected: (selectedTime) {
              // 格式化时间并更新字段值
              controller.controllers[key]?.text =
                  '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';
            },
          );
        },
      );
    }
    // 根据需要添加更多的后缀组件
    return null;
  }

  // 自定义时间选择对话框
  Future<void> showCustomTimePicker({
    required BuildContext context,
    required TimeOfDay initialTime,
    required ValueChanged<TimeOfDay> onTimeSelected,
  }) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (pickedTime != null) {
      onTimeSelected(pickedTime);
    }
  }

  Future<SemesterSchedule?> saveData(AddCourseController controller) async {
    if (controller.formKey.currentState?.validate() == true) {
      // 表单验证通过后提交数据
      final semesterSchedule = await controller.addCourse();
      return semesterSchedule;
    } else {
      // 表单验证失败，提示用户
      toastFailure0('请检查表单填写是否正确', gravity: ToastGravity.TOP);
    }
    return null;
  }
}
