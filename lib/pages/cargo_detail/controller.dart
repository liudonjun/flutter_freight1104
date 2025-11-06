import 'package:get/get.dart';

import 'state.dart';

class CargoDetailController extends GetxController {
  final state = CargoDetailState();

  // 复制运输单号
  void copyOrderNumber() {
    // TODO: 实现复制功能
    Get.snackbar('提示', '已复制运输单号');
  }

  // 查看位置(装货地)
  void viewOriginLocation() {
    // TODO: 实现查看装货地位置
  }

  // 查看位置(卸货地)
  void viewDestinationLocation() {
    // TODO: 实现查看卸货地位置
  }

  // 分享
  void share() {
    // TODO: 实现分享功能
  }

  // 立即抢单
  void grabOrder() {
    // TODO: 实现抢单功能
    Get.snackbar('提示', '抢单功能待开发');
  }
}
