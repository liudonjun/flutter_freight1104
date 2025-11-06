import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SchedulePage extends GetView<ScheduleController> {
  const SchedulePage({super.key});

  // 顶部日历网格视图
  Widget _buildWeekCalendar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // 月份和年份
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                final date = controller.currentMonth.value;
                return Text(
                  '${date.year}年${date.month}月',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                );
              }),
              Row(
                children: [
                  InkWell(
                    onTap: () => controller.previousMonth(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F8FA),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: Color(0xFF333333),
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () => controller.nextMonth(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F8FA),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.chevron_right,
                        color: Color(0xFF333333),
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          // 星期标题
          Row(
            children: ['日', '一', '二', '三', '四', '五', '六']
                .map((day) => Expanded(
                      child: Center(
                        child: Text(
                          day,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF989898),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 12),
          // 日期网格
          Obx(() => _buildCalendarGrid()),
        ],
      ),
    );
  }

  // 日历网格
  Widget _buildCalendarGrid() {
    final currentMonth = controller.currentMonth.value;
    final firstDayOfMonth = DateTime(currentMonth.year, currentMonth.month, 1);
    final lastDayOfMonth =
        DateTime(currentMonth.year, currentMonth.month + 1, 0);
    final firstWeekday = firstDayOfMonth.weekday % 7; // 0=周日, 6=周六
    final daysInMonth = lastDayOfMonth.day;

    List<Widget> dateWidgets = [];

    // 填充空白（上个月的日期）
    for (int i = 0; i < firstWeekday; i++) {
      dateWidgets.add(const SizedBox());
    }

    // 本月日期
    for (int day = 1; day <= daysInMonth; day++) {
      final date = DateTime(currentMonth.year, currentMonth.month, day);
      dateWidgets.add(_buildGridDateItem(date));
    }

    // 填充到完整周
    while (dateWidgets.length % 7 != 0) {
      dateWidgets.add(const SizedBox());
    }

    // 构建行
    List<Widget> rows = [];
    for (int i = 0; i < dateWidgets.length; i += 7) {
      rows.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: dateWidgets
                .sublist(i, i + 7)
                .map((widget) => Expanded(child: widget))
                .toList(),
          ),
        ),
      );
    }

    return Column(children: rows);
  }

  // 网格日期项
  Widget _buildGridDateItem(DateTime date) {
    final isToday = DateTime.now().year == date.year &&
        DateTime.now().month == date.month &&
        DateTime.now().day == date.day;

    return Obx(() {
      final isSelected = controller.selectedDate.value.year == date.year &&
          controller.selectedDate.value.month == date.month &&
          controller.selectedDate.value.day == date.day;

      final hasSchedule = controller.getScheduleByDate(date).isNotEmpty;

      return GestureDetector(
        onTap: () => controller.selectDate(date),
        child: Container(
          height: 56,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF007DF9),
                      Color(0xFF0051D5),
                    ],
                  )
                : null,
            color: isSelected
                ? null
                : (isToday ? const Color(0xFFF0F7FF) : Colors.transparent),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isToday && !isSelected
                  ? const Color(0xFF007DF9)
                  : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                '${date.day}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected || isToday
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: isSelected
                      ? Colors.white
                      : isToday
                          ? const Color(0xFF007DF9)
                          : const Color(0xFF333333),
                ),
              ),
              if (hasSchedule)
                Positioned(
                  bottom: 8,
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color:
                          isSelected ? Colors.white : const Color(0xFF007DF9),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }

  // 日程列表
  Widget _buildScheduleList() {
    return Obx(() {
      final schedules =
          controller.getScheduleByDate(controller.selectedDate.value);

      if (schedules.isEmpty) {
        return Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F8FA),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: const Icon(
                    Icons.event_busy_outlined,
                    size: 60,
                    color: Color(0xFFCCCCCC),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  '该日期暂无日程安排',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF989898),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _formatDate(controller.selectedDate.value),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFCCCCCC),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      return Expanded(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: schedules.length,
          itemBuilder: (context, index) {
            final isLast = index == schedules.length - 1;
            final isFirst = index == 0;
            return _buildScheduleItem(schedules[index], isFirst, isLast);
          },
        ),
      );
    });
  }

  // 格式化日期
  String _formatDate(DateTime date) {
    return '${date.year}年${date.month}月${date.day}日';
  }

  // 获取星期名称
  String _getWeekdayName(int weekday) {
    const weekdays = ['一', '二', '三', '四', '五', '六', '日'];
    return '星期${weekdays[weekday % 7]}';
  }

  // 单个日程项
  // 单个日程项
  Widget _buildScheduleItem(ScheduleItem item, bool isFirst, bool isLast) {
    Color statusColor = const Color(0xFF007DF9);

    switch (item.type) {
      case ScheduleType.loading:
        statusColor = const Color(0xFF007DF9);
        break;
      case ScheduleType.departure:
        statusColor = const Color(0xFFFF9800);
        break;
      case ScheduleType.delivery:
        statusColor = const Color(0xFF4CAF50);
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 日期标题（仅在第一个显示）
        if (isFirst)
          Padding(
            padding: const EdgeInsets.only(left: 19, bottom: 14),
            child: Text(
              '${item.date.month}月${item.date.day}日 ${_getWeekdayName(item.date.weekday)}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
              ),
            ),
          ),
        // 内容区域
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 时间轴
            SizedBox(
              width: 24,
              child: Column(
                children: [
                  // 圆点
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: statusColor.withOpacity(0.4),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: statusColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  // 虚线
                  if (!isLast)
                    Container(
                      width: 1,
                      height: 140,
                      margin: const EdgeInsets.only(top: 2),
                      child: CustomPaint(
                        painter: DashedLinePainter(
                          color: const Color(0xFFCDCDCD),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            // 卡片内容
            Expanded(
              child: GestureDetector(
                onTap: () => controller.viewDetail(item),
                child: Container(
                  margin: EdgeInsets.only(bottom: isLast ? 0 : 14),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F8FA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 顶部：标签 + 地点名称
                      Row(
                        children: [
                          // 标签
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: statusColor,
                                width: 0.6,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Text(
                              item.title,
                              style: TextStyle(
                                fontSize: 12,
                                color: statusColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // 地点名称
                          Text(
                            item.location,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF333333),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // 时间
                      Text(
                        item.time,
                        style: const TextStyle(
                          fontFamily: 'DIN',
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF333333),
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // 用户信息
                      Row(
                        children: [
                          // 头像
                          Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: Color(0xFFCCCCCC),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          // 用户名和电话
                          const Text(
                            '元老板 162***3621',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF333333),
                            ),
                          ),
                          const Spacer(),
                          // 查看箭头
                          const Icon(
                            Icons.chevron_right,
                            size: 16,
                            color: Color(0xFF989898),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 顶部统计卡片
  Widget _buildStatCard() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF007DF9),
            Color(0xFF0051D5),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF007DF9).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Obx(() {
        final today = DateTime.now();
        final todaySchedules = controller.getScheduleByDate(today);
        final selectedSchedules =
            controller.getScheduleByDate(controller.selectedDate.value);

        return Row(
          children: [
            Expanded(
              child: _buildStatItem(
                Icons.today_outlined,
                '今日任务',
                '${todaySchedules.length}',
                Colors.white,
              ),
            ),
            Container(
              width: 1,
              height: 40,
              color: Colors.white.withOpacity(0.3),
            ),
            Expanded(
              child: _buildStatItem(
                Icons.event_note_outlined,
                '选中日期',
                '${selectedSchedules.length}',
                Colors.white,
              ),
            ),
          ],
        );
      }),
    );
  }

  // 统计项
  Widget _buildStatItem(
      IconData icon, String label, String value, Color color) {
    return Column(
      children: [
        Icon(icon, color: color.withOpacity(0.9), size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        _buildWeekCalendar(),
        Expanded(
          child: Container(
            color: const Color(0xFFF7F8FA),
            child: Column(
              children: [
                // _buildStatCard(),
                _buildScheduleList(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScheduleController>(
      init: ScheduleController(),
      id: "schedule",
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios,
                  size: 20, color: Color(0xFF333333)),
              onPressed: () => Get.back(),
            ),
            title: const Text(
              '日程安排',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.add_circle_outline,
                    color: Color(0xFF007DF9)),
                onPressed: () {
                  Get.snackbar('提示', '添加日程功能待开发');
                },
              ),
            ],
          ),
          body: _buildView(),
        );
      },
    );
  }
}

// 虚线绘制器
class DashedLinePainter extends CustomPainter {
  final Color color;

  DashedLinePainter({this.color = const Color(0xFFCDCDCD)});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    const dashHeight = 4;
    const dashSpace = 3;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
