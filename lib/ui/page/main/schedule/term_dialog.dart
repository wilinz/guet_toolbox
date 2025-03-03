import 'package:flutter/material.dart';

class CustomTermDialog<T> extends StatelessWidget {
  final List<T> items; // 泛型列表
  final T selectedItem; // 当前选中的泛型项目
  final String title; // 对话框标题
  final Function(T) onSelectItem; // 选择项目后的回调函数
  final String Function(T) displayItem; // 显示项目的方式
  final double maxHeightFactor; // 对话框最大高度的比例

  CustomTermDialog({
    required this.items,
    required this.selectedItem,
    required this.title,
    required this.onSelectItem,
    required this.displayItem, // 通过此函数将泛型对象转为可显示的字符串
    this.maxHeightFactor = 0.5, // 默认最大高度为屏幕的 60%
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * maxHeightFactor, // 设置最大高度
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24,24,24,36),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: items.map((item) {
                    return SimpleDialogOption(
                      onPressed: () {
                        Navigator.of(context).pop();
                        onSelectItem(item); // 调用回调函数
                      },
                      child: Text(
                        displayItem(item), // 通过 displayItem 函数来显示泛型项目
                        style: TextStyle(
                          color: item == selectedItem
                              ? Theme.of(context).colorScheme.primary
                              : null,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
