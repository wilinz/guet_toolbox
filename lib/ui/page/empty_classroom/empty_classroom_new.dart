import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/empty_classroom/empty_classroom_buildings/empty_classroom_buildings.dart';
import 'package:guethub/data/model/empty_classroom/empty_classroom_rooms/empty_classroom_rooms.dart';

import '../../../data/model/empty_classroom/empty_classroom_config/empty_classroom_config.dart';
import '../../../data/model/empty_classroom/empty_classroom_query_result/empty_classroom_query_result.dart';
import 'empty_classroom_new_controller.dart';

class EmptyClassroomNewPage extends StatelessWidget {
  const EmptyClassroomNewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(EmptyClassroomNewController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("空教室查询"),
      ),
      body: Obx(() {
        // 初次加载时，如果 config 为空，则显示全屏 loading
        if (c.config.value == null) {
          return const Center(child: CircularProgressIndicator());
        }
        if (c.hasError.value) {
          return const Center(child: Text("加载失败"));
        }
        // 显示表单和查询结果
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. 校区下拉框（必选，不含 null 选项）
              _buildCampusDropdown(c),
              const SizedBox(height: 16),

              // 2. 教学楼下拉框（含 null 选项 + 局部加载指示器）
              _buildBuildingDropdown(c),
              const SizedBox(height: 16),

              // 3. 教室下拉框（含 null 选项 + 局部加载指示器）
              _buildRoomDropdown(c),
              const SizedBox(height: 16),

              // 4. 教室类型下拉框（含 null 选项）
              _buildRoomTypeDropdown(c),
              const SizedBox(height: 16),

              // 5. 容量输入
              _buildCapacityField(c),
              const SizedBox(height: 16),

              // ============== 互斥：按教学周 / 按日期 ==============
              _buildWeekOrDateToggle(c),
              const SizedBox(height: 16),

              // 如果 isByWeek = true，则显示“周次”，否则显示“日期范围”
              Obx(() => c.isByWeek.value
                  ? _buildWeeksSelection(c)
                  : _buildDateRange(c, context)),
              const SizedBox(height: 16),

              // 星期几选择（可根据业务需求调整是否在“按日期”时隐藏）
              _buildWeekdaySelection(c),
              const SizedBox(height: 16),

              // ============== 互斥：按时间 / 按节次 ==============
              _buildTimeOrUnitsToggle(c),
              const SizedBox(height: 16),

              // 如果 isByTime = true，则显示“时间范围”，否则显示“节次”
              Obx(() => c.isByTime.value
                  ? _buildTimeRange(c, context)
                  : _buildUnitsSelection(c)),
              const SizedBox(height: 16),

              // 查询按钮（局部 loading，不全屏）
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: c.isQueryLoading.value
                      ? null
                      : () {
                    c.searchEmptyClassroom();
                  },
                  child: c.isQueryLoading.value
                      ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                      : const Text("查询空教室"),
                ),
              ),
              const SizedBox(height: 16),

              // 查询结果显示
              _buildQueryResult(c),
            ],
          ),
        );
      }),
    );
  }

  /// 选择校区下拉（无 null 选项）
  Widget _buildCampusDropdown(EmptyClassroomNewController c) {
    final campuses = c.config.value?.campus ?? [];
    return DropdownButtonFormField<Campus>(
      decoration: const InputDecoration(
        labelText: "校区",
        border: OutlineInputBorder(),
      ),
      value: c.selectedCampus.value,
      items: campuses.map((campus) {
        return DropdownMenuItem<Campus>(
          value: campus,
          child: Text(campus.text),
        );
      }).toList(),
      onChanged: (val) {
        c.selectedCampus.value = val;
      },
    );
  }

  /// 教学楼下拉框（含 null 选项 + 局部加载指示器）
  Widget _buildBuildingDropdown(EmptyClassroomNewController c) {
    return Obx(() {
      final List<DropdownMenuItem<EmptyClassroomBuilding?>> items = [];
      items.add(
        const DropdownMenuItem<EmptyClassroomBuilding?>(
          value: null,
          child: Text("不选择教学楼"),
        ),
      );
      for (var b in c.buildings) {
        items.add(
          DropdownMenuItem<EmptyClassroomBuilding?>(
            value: b,
            child: Text(b.nameZh ?? "未知教学楼"),
          ),
        );
      }
      return Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<EmptyClassroomBuilding?>(
              decoration: const InputDecoration(
                labelText: "教学楼",
                border: OutlineInputBorder(),
              ),
              value: c.selectedBuilding.value,
              items: items,
              onChanged: (val) {
                c.selectedBuilding.value = val;
              },
            ),
          ),
          if (c.isLoadingBuildings.value) ...[
            const SizedBox(width: 8),
            const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ],
        ],
      );
    });
  }

  /// 教室下拉框（含 null 选项 + 局部加载指示器）
  Widget _buildRoomDropdown(EmptyClassroomNewController c) {
    return Obx(() {
      final List<DropdownMenuItem<EmptyClassroomRoom?>> items = [];
      items.add(
        const DropdownMenuItem<EmptyClassroomRoom?>(
          value: null,
          child: Text("不选择教室"),
        ),
      );
      for (var room in c.rooms) {
        items.add(
          DropdownMenuItem<EmptyClassroomRoom?>(
            value: room,
            child: Text(room.nameZh ?? "未知教室"),
          ),
        );
      }
      return Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<EmptyClassroomRoom?>(
              decoration: const InputDecoration(
                labelText: "教室",
                border: OutlineInputBorder(),
              ),
              value: c.selectedRoom.value,
              items: items,
              onChanged: (val) {
                c.selectedRoom.value = val;
              },
            ),
          ),
          if (c.isLoadingRooms.value) ...[
            const SizedBox(width: 8),
            const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ],
        ],
      );
    });
  }

  /// 教室类型下拉框（含 null 选项）
  Widget _buildRoomTypeDropdown(EmptyClassroomNewController c) {
    final roomTypes = c.config.value?.roomTypes ?? [];
    // 增加一个 null 选项
    final items = <DropdownMenuItem<RoomType?>>[
      const DropdownMenuItem<RoomType?>(
        value: null,
        child: Text("不选择教室类型"),
      )
    ];
    items.addAll(
      roomTypes.map((type) {
        return DropdownMenuItem<RoomType?>(
          value: type,
          child: Text(type.text),
        );
      }).toList(),
    );
    return DropdownButtonFormField<RoomType?>(
      decoration: const InputDecoration(
        labelText: "教室类型",
        border: OutlineInputBorder(),
      ),
      value: c.selectedRoomType.value,
      items: items,
      onChanged: (val) {
        c.selectedRoomType.value = val;
      },
    );
  }

  /// 教室容量
  Widget _buildCapacityField(EmptyClassroomNewController c) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "教室容量",
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      onChanged: (val) {
        if (val.isNotEmpty) {
          c.capacity.value = int.tryParse(val) ?? 0;
        } else {
          c.capacity.value = null;
        }
      },
    );
  }

  /// 切换：按教学周 / 按日期
  Widget _buildWeekOrDateToggle(EmptyClassroomNewController c) {
    return Row(
      children: [
        Obx(() => ChoiceChip(
          label: const Text("按教学周"),
          selected: c.isByWeek.value,
          onSelected: (bool value) {
            c.isByWeek.value = true;
          },
        )),
        const SizedBox(width: 16),
        Obx(() => ChoiceChip(
          label: const Text("按日期"),
          selected: !c.isByWeek.value,
          onSelected: (bool value) {
            c.isByWeek.value = false;
          },
        )),
      ],
    );
  }

  /// 多选周次
  Widget _buildWeeksSelection(EmptyClassroomNewController c) {
    final totalWeeks = c.config.value?.semesterWeeks ?? 0;
    final weeks = List.generate(totalWeeks, (index) => (index + 1).toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("选择周次"),
        Wrap(
          spacing: 8.0,
          children: weeks.map((week) {
            return Obx(() {
              final selected = c.selectedWeeks.contains(week);
              return ChoiceChip(
                label: Text(week),
                selected: selected,
                onSelected: (bool value) {
                  if (value) {
                    c.selectedWeeks.add(week);
                  } else {
                    c.selectedWeeks.remove(week);
                  }
                },
              );
            });
          }).toList(),
        ),
      ],
    );
  }

  /// 多选星期几
  Widget _buildWeekdaySelection(EmptyClassroomNewController c) {
    final weekdays = ["1", "2", "3", "4", "5", "6", "7"];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("选择星期几"),
        Wrap(
          spacing: 8.0,
          children: weekdays.map((day) {
            return Obx(() {
              final selected = c.selectedWeekdays.contains(day);
              return ChoiceChip(
                label: Text("周$day"),
                selected: selected,
                onSelected: (bool value) {
                  if (value) {
                    c.selectedWeekdays.add(day);
                  } else {
                    c.selectedWeekdays.remove(day);
                  }
                },
              );
            });
          }).toList(),
        ),
      ],
    );
  }

  /// 选择日期范围
  Widget _buildDateRange(EmptyClassroomNewController c, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("选择日期范围"),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: "起始日期",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.date_range),
                ),
                controller: TextEditingController(text: c.startDatetime.value ?? ""),
                onTap: () async {
                  final now = DateTime.now();
                  final result = await showDatePicker(
                    context: context,
                    initialDate: now,
                    firstDate: DateTime(now.year - 1),
                    lastDate: DateTime(now.year + 1),
                  );
                  if (result != null) {
                    c.startDatetime.value = result.toString().split(" ").first;
                  }
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: "结束日期",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.date_range),
                ),
                controller: TextEditingController(text: c.endDatetime.value ?? ""),
                onTap: () async {
                  final now = DateTime.now();
                  final result = await showDatePicker(
                    context: context,
                    initialDate: now,
                    firstDate: DateTime(now.year - 1),
                    lastDate: DateTime(now.year + 1),
                  );
                  if (result != null) {
                    c.endDatetime.value = result.toString().split(" ").first;
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// 切换：按时间 / 按节次
  Widget _buildTimeOrUnitsToggle(EmptyClassroomNewController c) {
    return Row(
      children: [
        Obx(() => ChoiceChip(
          label: const Text("按节次"),
          selected: !c.isByTime.value,
          onSelected: (bool value) {
            c.isByTime.value = false;
          },
        )),
        const SizedBox(width: 16),
        Obx(() => ChoiceChip(
          label: const Text("按时间"),
          selected: c.isByTime.value,
          onSelected: (bool value) {
            c.isByTime.value = true;
          },
        )),
      ],
    );
  }

  /// 多选节次
  Widget _buildUnitsSelection(EmptyClassroomNewController c) {
    final units = c.config.value?.units ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("选择节次"),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          children: units.map((unit) {
            return Obx(() {
              final selected = c.selectedUnits.contains(unit.value);
              return ChoiceChip(
                label: Text(unit.name),
                selected: selected,
                onSelected: (bool value) {
                  if (value) {
                    c.selectedUnits.add(unit.value);
                  } else {
                    c.selectedUnits.remove(unit.value);
                  }
                },
              );
            });
          }).toList(),
        ),
      ],
    );
  }

  /// 选择时间范围
  Widget _buildTimeRange(EmptyClassroomNewController c, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("选择时间范围"),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: "开始时间",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.access_time),
                ),
                controller: TextEditingController(text: c.startTime.value),
                onTap: () async {
                  final now = TimeOfDay.now();
                  final result = await showTimePicker(
                    context: context,
                    initialTime: now,
                  );
                  if (result != null) {
                    c.startTime.value = result.format(context);
                  }
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: "结束时间",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.access_time),
                ),
                controller: TextEditingController(text: c.endTime.value),
                onTap: () async {
                  final now = TimeOfDay.now();
                  final result = await showTimePicker(
                    context: context,
                    initialTime: now,
                  );
                  if (result != null) {
                    c.endTime.value = result.format(context);
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// 查询结果显示
  Widget _buildQueryResult(EmptyClassroomNewController c) {
    return Obx(() {
      final result = c.queryResult.value;
      if (result == null) {
        return const SizedBox.shrink();
      }
      if (result.roomList.isEmpty) {
        return Column(
          children: [
            const Center(child: Text("暂无数据")),
            SizedBox(height: 24,)
          ],
        );
      }
      return ListView.builder(
        itemCount: result.roomList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final room = result.roomList[index];
          return ListTile(
            title: Text("教室：${room.nameZh}"),
            subtitle: Text("座位数：${room.seatsForLesson} 教室类型：${room.roomType.nameZh} 备注：${room.remark}"),
          );
        },
      );
    });
  }
}
