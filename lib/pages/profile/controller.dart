import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileController();

  _initData() {
    update(["profile"]);
  }

  void onTap() {}

  void onSave() {
    // TODO: 保存个人资料
    Get.snackbar('提示', '保存成功');
  }

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
