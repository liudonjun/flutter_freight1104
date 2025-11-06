import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverVerifyController extends GetxController {
  DriverVerifyController();

  // 表单控制器
  final nameController = TextEditingController();
  final idCardController = TextEditingController();
  final licenseController = TextEditingController();
  final qualificationController = TextEditingController();

  // 认证状态
  var verifyStatus = VerifyStatus.unverified.obs;

  // 上传的照片
  var idCardFrontPhoto = ''.obs;
  var idCardBackPhoto = ''.obs;
  var driverLicensePhoto = ''.obs;
  var qualificationPhoto = ''.obs;

  // 选择照片
  Future<void> pickPhoto(PhotoType type) async {
    // TODO: 实现图片选择功能
    Get.snackbar('提示', '选择${_getPhotoTypeName(type)}照片');

    // 模拟上传
    await Future.delayed(const Duration(milliseconds: 500));
    switch (type) {
      case PhotoType.idCardFront:
        idCardFrontPhoto.value = 'uploaded';
        break;
      case PhotoType.idCardBack:
        idCardBackPhoto.value = 'uploaded';
        break;
      case PhotoType.driverLicense:
        driverLicensePhoto.value = 'uploaded';
        break;
      case PhotoType.qualification:
        qualificationPhoto.value = 'uploaded';
        break;
    }
  }

  String _getPhotoTypeName(PhotoType type) {
    switch (type) {
      case PhotoType.idCardFront:
        return '身份证正面';
      case PhotoType.idCardBack:
        return '身份证反面';
      case PhotoType.driverLicense:
        return '驾驶证';
      case PhotoType.qualification:
        return '从业资格证';
    }
  }

  // 提交认证
  void submitVerify() {
    if (nameController.text.isEmpty) {
      Get.snackbar('提示', '请输入真实姓名');
      return;
    }
    if (idCardController.text.isEmpty) {
      Get.snackbar('提示', '请输入身份证号');
      return;
    }
    if (licenseController.text.isEmpty) {
      Get.snackbar('提示', '请输入驾驶证号');
      return;
    }
    if (idCardFrontPhoto.value.isEmpty || idCardBackPhoto.value.isEmpty) {
      Get.snackbar('提示', '请上传身份证照片');
      return;
    }
    if (driverLicensePhoto.value.isEmpty) {
      Get.snackbar('提示', '请上传驾驶证照片');
      return;
    }

    // TODO: 调用API提交认证
    Get.snackbar('提示', '认证资料已提交，请等待审核');
    verifyStatus.value = VerifyStatus.reviewing;
  }

  _initData() {
    update(["driver_verify"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    nameController.dispose();
    idCardController.dispose();
    licenseController.dispose();
    qualificationController.dispose();
    super.onClose();
  }
}

// 照片类型
enum PhotoType {
  idCardFront,
  idCardBack,
  driverLicense,
  qualification,
}

// 认证状态
enum VerifyStatus {
  unverified, // 未认证
  reviewing, // 审核中
  verified, // 已认证
  rejected, // 已拒绝
}
