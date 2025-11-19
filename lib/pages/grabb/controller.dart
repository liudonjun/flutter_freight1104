import 'package:get/get.dart';

class GrabbController extends GetxController {
  GrabbController();

  // 选中的标签索引
  final selectedTabIndex = 0.obs;

  _initData() {
    update(["grabb"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
