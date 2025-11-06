import 'package:get/get.dart';

class ScheduleController extends GetxController {
  ScheduleController();

  // 当前选中的日期
  var selectedDate = DateTime.now().obs;

  // 当前显示的月份
  var currentMonth = DateTime.now().obs;

  // 日程列表数据
  var scheduleList = <ScheduleItem>[
    ScheduleItem(
      id: '1',
      date: DateTime.now(),
      time: '14:00',
      title: '装货',
      location: '重庆-巴南区',
      address: '大九公里街道办旁兴业物流园',
      orderNumber: 'HY673784722464',
      status: '待装货',
      type: ScheduleType.loading,
      cargo: '饮料类 | 20吨',
    ),
    ScheduleItem(
      id: '2',
      date: DateTime.now(),
      time: '16:30',
      title: '出发',
      location: '重庆',
      address: '前往深圳',
      orderNumber: 'HY673784722465',
      status: '运输中',
      type: ScheduleType.departure,
      cargo: '饮料类 | 20吨',
    ),
    ScheduleItem(
      id: '3',
      date: DateTime.now().add(const Duration(days: 7)),
      time: '19:00',
      title: '送达',
      location: '深圳-南山区',
      address: '高新中一道2号长园新材料港4栋1楼',
      orderNumber: 'HY673784722464',
      status: '待送达',
      type: ScheduleType.delivery,
      cargo: '饮料类 | 20吨',
    ),
    ScheduleItem(
      id: '4',
      date: DateTime.now().add(const Duration(days: 1)),
      time: '10:00',
      title: '装货',
      location: '成都-武侯区',
      address: '天府大道中段168号',
      orderNumber: 'HY673784722466',
      status: '待装货',
      type: ScheduleType.loading,
      cargo: '电子产品 | 5吨',
    ),
  ].obs;

  // 获取指定日期的日程
  List<ScheduleItem> getScheduleByDate(DateTime date) {
    return scheduleList.where((item) {
      return item.date.year == date.year &&
          item.date.month == date.month &&
          item.date.day == date.day;
    }).toList()
      ..sort((a, b) => a.time.compareTo(b.time));
  }

  // 选择日期
  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  // 上一个月
  void previousMonth() {
    currentMonth.value = DateTime(
      currentMonth.value.year,
      currentMonth.value.month - 1,
    );
  }

  // 下一个月
  void nextMonth() {
    currentMonth.value = DateTime(
      currentMonth.value.year,
      currentMonth.value.month + 1,
    );
  }

  // 获取今日日程
  List<ScheduleItem> get todaySchedule {
    return getScheduleByDate(DateTime.now());
  }

  // 获取指定月份有日程的日期
  Set<int> getDatesWithScheduleInMonth(DateTime month) {
    return scheduleList
        .where((item) =>
            item.date.year == month.year && item.date.month == month.month)
        .map((item) => item.date.day)
        .toSet();
  }

  // 查看详情
  void viewDetail(ScheduleItem item) {
    Get.snackbar(
      '订单详情',
      '订单号: ${item.orderNumber}\n货物: ${item.cargo}',
      duration: const Duration(seconds: 2),
    );
  }

  _initData() {
    update(["schedule"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}

// 日程类型
enum ScheduleType {
  loading, // 装货
  departure, // 出发
  delivery, // 送达
}

// 日程项模型
class ScheduleItem {
  final String id;
  final DateTime date;
  final String time;
  final String title;
  final String location;
  final String address;
  final String orderNumber;
  final String status;
  final ScheduleType type;
  final String cargo;

  ScheduleItem({
    required this.id,
    required this.date,
    required this.time,
    required this.title,
    required this.location,
    required this.address,
    required this.orderNumber,
    required this.status,
    required this.type,
    required this.cargo,
  });
}
