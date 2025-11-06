import 'package:get/get.dart';

class MineController extends GetxController {
  MineController();

  // 用户信息
  var userName = '张师傅'.obs;
  var userPhone = '138****8888'.obs;
  var isVerified = true.obs;

  // 车辆信息
  var vehicleType = '6.8米厢式车'.obs;
  var vehiclePlate = '川A·88888'.obs;

  // 统计数据
  var completedOrders = 156.obs;
  var totalIncome = 89520.obs;
  var todayOrders = 3.obs;

  // 菜单项
  final List<Map<String, dynamic>> menuItems = [
    {
      'icon': '🚗',
      'title': '我的车辆',
      'subtitle': '车辆管理',
    },
    {
      'icon': '📋',
      'title': '我的订单',
      'subtitle': '订单管理',
    },
    {
      'icon': '💰',
      'title': '我的钱包',
      'subtitle': '收入明细',
    },
    {
      'icon': '⭐',
      'title': '我的评价',
      'subtitle': '查看评价',
    },
    {
      'icon': '📍',
      'title': '地址管理',
      'subtitle': '常用地址',
    },
    {
      'icon': '⚙️',
      'title': '设置',
      'subtitle': '系统设置',
    },
  ];

  // 点击菜单项
  void onMenuTap(int index) {
    final title = menuItems[index]['title'];

    switch (index) {
      case 0: // 司机认证
        // 跳转到司机认证页面
        break;
      case 1: // 我的钱包
        Get.snackbar('提示', '点击了 $title');
        break;
      case 2: // 我的票据
        Get.snackbar('提示', '点击了 $title');
        break;
      case 3: // 教学培训
        Get.snackbar('提示', '点击了 $title');
        break;
      case 4: // 投诉与建议
        Get.snackbar('提示', '点击了 $title');
        break;
      case 5: // 设置
        Get.snackbar('提示', '点击了 $title');
        break;
    }
  }

  // 编辑资料
  void editProfile() {
    Get.snackbar('提示', '编辑资料');
  }

  // 查看车辆
  void viewVehicle() {
    Get.snackbar('提示', '查看车辆信息');
  }

  _initData() {
    update(["mine"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
