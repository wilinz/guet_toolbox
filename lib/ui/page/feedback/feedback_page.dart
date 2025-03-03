import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'feedback_controller.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'feedback_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'feedback_controller.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'feedback_controller.dart';
import 'dart:io';

class FeedbackPage extends StatelessWidget {
  final FeedbackController controller = Get.put(FeedbackController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('提交反馈'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              // 标签选择
              Obx(() => DropdownButtonFormField<String>(
                autovalidateMode: AutovalidateMode.disabled,
                value: controller.label.value.isNotEmpty
                    ? controller.label.value
                    : null,
                decoration: InputDecoration(labelText: '标签（建议，出错，求助）'),
                items: controller.labelOptions.map((label) {
                  return DropdownMenuItem<String>(
                    value: label,
                    child: Text(label),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.label.value = value ?? '';
                },
                validator: (value) {
                  return value == null || value.isEmpty ? '请选择一个标签' : null;
                },
              )),
              SizedBox(height: 16),
              // 联系方式类型选择
              Obx(() => DropdownButtonFormField<String>(
                autovalidateMode: AutovalidateMode.disabled,
                value: controller.contactType.value.isNotEmpty
                    ? controller.contactType.value
                    : null,
                decoration: InputDecoration(labelText: '联系方式类型'),
                items: controller.contactTypeOptions.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.contactType.value = value ?? '';
                },
                validator: (value) {
                  return value == null || value.isEmpty ? '请选择联系方式类型' : null;
                },
              )),
              SizedBox(height: 16),
              // 联系方式输入
              Obx(() {
                return TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  onChanged: (value) => controller.contact.value = value,
                  decoration: InputDecoration(
                    labelText:
                    '请输入您的${controller.contactType.value.isNotEmpty ? controller.contactType.value : "联系方式"}',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '内容不能为空';
                    } else if (!controller.isValidContact(
                        value, controller.contactType.value)) {
                      return '请输入有效的${controller.contactType.value}';
                    }
                    return null;
                  },
                );
              }),
              SizedBox(height: 16),
              // 反馈内容输入
              TextFormField(
                autovalidateMode: AutovalidateMode.disabled,
                onChanged: (value) => controller.feedback.value = value,
                decoration: InputDecoration(labelText: '反馈内容'),
                validator: (v) {
                  return v.isBlank == true ? '内容不能为空' : null;
                },
              ),
              SizedBox(height: 16),
              // 图片上传
              Obx(() => Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ...controller.images.map((image) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        children: [
                          Image.file(
                            File(image.path),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            right: 0,
                            child: IconButton(
                              onPressed: () =>
                                  controller.images.remove(image),
                              icon: Icon(Icons.close, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: controller.pickImage,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Color(0x11000000),
                        child: Icon(
                          Icons.add_a_photo,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: Obx(() => ElevatedButton(
                  onPressed: controller.isLoading.isFalse
                      ? controller.submitFeedback
                      : null,
                  child:
                  Text(controller.isLoading.isFalse ? '提交' : '正在提交...'),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
