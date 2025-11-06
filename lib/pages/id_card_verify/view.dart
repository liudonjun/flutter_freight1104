import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/values/images.dart';
import 'index.dart';

class IdCardVerifyPage extends GetView<IdCardVerifyController> {
  const IdCardVerifyPage({super.key});

  // 顶部提示文字
  Widget _buildTopHint() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
                height: 1.4,
              ),
              children: [
                TextSpan(text: '请拍摄/上传'),
                TextSpan(
                  text: '黄*渝',
                  style: TextStyle(
                    color: Color.fromARGB(255, 33, 120, 220),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(text: '本人身份证'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  '请确保证件边框完整、字体清晰、亮度均匀',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.info_outline,
                size: 16,
                color: Colors.grey.shade500,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 身份证上传区域
  Widget _buildIdCardUpload() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '上传身份证照片',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          // 身份证正面
          _buildPhotoUploadCard(
            label: '身份证正面',
            isFront: true,
            photoPath: controller.idCardFrontPhoto,
            icon: AssetsImages.idNamePng,
          ),
          const SizedBox(height: 16),
          // 身份证反面
          _buildPhotoUploadCard(
            label: '身份证反面',
            isFront: false,
            photoPath: controller.idCardBackPhoto,
            icon: AssetsImages.icName1Png,
          ),
        ],
      ),
    );
  }

  // 照片上传卡片
  Widget _buildPhotoUploadCard({
    required String label,
    required bool isFront,
    required RxString photoPath,
    required String icon,
  }) {
    return Obx(() {
      final hasPhoto = photoPath.value.isNotEmpty;

      return GestureDetector(
        onTap: () => controller.pickPhoto(isFront),
        child: Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFF7F8FA),
            borderRadius: BorderRadius.circular(12),
          ),
          child: hasPhoto
              ? Stack(
                  children: [
                    // 显示已拍摄的照片
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(photoPath.value),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.broken_image,
                                  size: 60,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  '图片加载失败',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF999999),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4CAF50),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          '点击重新上传',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Stack(
                  children: [
                    // 边框装饰图
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image.asset(
                          AssetsImages.icKuanPng,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 54, vertical: 20),
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    // 显示模板图片
                    Center(
                      child: Opacity(
                        opacity: 0.5,
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Image.asset(
                            icon,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.credit_card,
                                size: 80,
                                color: Colors.grey.shade300,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    // 中间的上传图标和文字
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color(0xFF007DF9),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 32,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '点击上传$label',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF333333),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      );
    });
  }

  // 协议选择
  Widget _buildProtocolCheckbox() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 12, 15, 0),
      child: Obx(() {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                controller.agreeProtocol.value =
                    !controller.agreeProtocol.value;
              },
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: controller.agreeProtocol.value
                      ? const Color(0xFF007DF9)
                      : Colors.white,
                  border: Border.all(
                    color: controller.agreeProtocol.value
                        ? const Color(0xFF007DF9)
                        : const Color(0xFFCCCCCC),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: controller.agreeProtocol.value
                    ? const Icon(
                        Icons.check,
                        size: 14,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF666666),
                  ),
                  children: [
                    const TextSpan(text: '我已阅读并同意'),
                    TextSpan(
                      text: '《身份证认证协议》',
                      style: const TextStyle(
                        color: Color(0xFF007DF9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  // 提交按钮
  Widget _buildSubmitButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 12, 15, 15),
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: controller.submitVerify,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF007DF9),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          '提交认证',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IdCardVerifyController>(
      init: IdCardVerifyController(),
      id: "id_card_verify",
      builder: (_) {
        return Scaffold(
          backgroundColor: const Color(0xFFF7F8FA),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Color(0xFF333333),
              ),
              onPressed: () => Get.back(),
            ),
            title: const Text(
              '身份证认证',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildTopHint(),
                      const SizedBox(height: 12),
                      _buildIdCardUpload(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      offset: const Offset(0, -2),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: SafeArea(
                  top: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildProtocolCheckbox(),
                      _buildSubmitButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
