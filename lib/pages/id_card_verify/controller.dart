import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class IdCardVerifyController extends GetxController {
  IdCardVerifyController();

  // 表单控制器
  final nameController = TextEditingController();
  final idNumberController = TextEditingController();

  // 上传的照片路径
  var idCardFrontPhoto = ''.obs;
  var idCardBackPhoto = ''.obs;

  // 是否同意协议
  var agreeProtocol = false.obs;

  // 图片选择器
  final ImagePicker _picker = ImagePicker();

  // 选择照片
  Future<void> pickPhoto(bool isFront) async {
    // 显示选择来源的底部弹窗
    final source = await _showImageSourceDialog();
    if (source == null) return;

    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 85, // 压缩质量
        maxWidth: 1920, // 最大宽度
        maxHeight: 1080, // 最大高度
      );

      if (image != null) {
        if (isFront) {
          idCardFrontPhoto.value = image.path;
        } else {
          idCardBackPhoto.value = image.path;
        }
        Get.snackbar(
          '成功',
          '${isFront ? '身份证正面' : '身份证反面'}照片已选择',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 1),
        );
      }
    } catch (e) {
      Get.snackbar(
        '错误',
        '选择照片失败：$e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // 显示图片来源选择对话框
  Future<ImageSource?> _showImageSourceDialog() async {
    return await Get.bottomSheet<ImageSource>(
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              const Text(
                '选择照片来源',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(
                  Icons.camera_alt,
                  color: Color(0xFF007DF9),
                  size: 28,
                ),
                title: const Text(
                  '拍照',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () => Get.back(result: ImageSource.camera),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(
                  Icons.photo_library,
                  color: Color(0xFF007DF9),
                  size: 28,
                ),
                title: const Text(
                  '从相册选择',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () => Get.back(result: ImageSource.gallery),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text(
                  '取消',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF999999),
                  ),
                ),
                onTap: () => Get.back(),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      isDismissible: true,
    );
  }

  // 提交认证
  void submitVerify() {
    if (nameController.text.isEmpty) {
      Get.snackbar('提示', '请输入真实姓名');
      return;
    }
    if (idNumberController.text.isEmpty) {
      Get.snackbar('提示', '请输入身份证号');
      return;
    }
    if (idNumberController.text.length != 18) {
      Get.snackbar('提示', '请输入正确的身份证号');
      return;
    }
    if (idCardFrontPhoto.value.isEmpty) {
      Get.snackbar('提示', '请上传身份证正面照片');
      return;
    }
    if (idCardBackPhoto.value.isEmpty) {
      Get.snackbar('提示', '请上传身份证反面照片');
      return;
    }
    if (!agreeProtocol.value) {
      Get.snackbar('提示', '请阅读并同意《身份证认证协议》');
      return;
    }

    // TODO: 调用API提交认证
    Get.snackbar('成功', '身份证认证资料已提交，请等待审核');
    Future.delayed(const Duration(seconds: 1), () {
      Get.back();
    });
  }

  _initData() {
    update(["id_card_verify"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    nameController.dispose();
    idNumberController.dispose();
    super.onClose();
  }
}
