import 'package:get/get.dart';

class WaybillController extends GetxController {
  WaybillController();

  // 当前选中的tab索引
  var selectedTabIndex = 0.obs;

  // Tab标签
  final List<String> tabs = ['正在进行', '已完成', '已取消'];

  // 切换Tab
  void switchTab(int index) {
    selectedTabIndex.value = index;
  }

  // 复制运输单号
  void copyOrderNumber(String orderNumber) {
    Get.snackbar('提示', '已复制运输单号: $orderNumber');
  }

  // 拨打电话
  void callPhone(String phone) {
    // TODO: 实现拨打电话功能
    Get.snackbar('提示', '拨打电话: $phone');
  }

  // 发送消息
  void sendMessage() {
    // TODO: 实现发送消息功能
    Get.snackbar('提示', '发送消息');
  }

  // 查看位置
  void viewLocation(String address) {
    // TODO: 实现查看位置功能
    Get.snackbar('提示', '查看位置: $address');
  }

  // 取消运单
  void cancelOrder() {
    Get.snackbar('提示', '取消运单');
  }

  // 转接他人
  void transferOrder() {
    Get.snackbar('提示', '转接他人');
  }

  _initData() {
    update(["waybill"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
