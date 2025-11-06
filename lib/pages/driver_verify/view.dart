import 'package:flutter/material.dart';
import 'package:flutter_freight/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class DriverVerifyPage extends GetView<DriverVerifyController> {
  const DriverVerifyPage({super.key});

  // 顶部提示卡片
  Widget _buildTipCard() {
    return Container(
      height: 37,
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 14),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF007DF9).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // 提示图标
          Container(
            width: 17,
            height: 17,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8.5),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.info_outline,
                  size: 15,
                  color: const Color(0xFF007DF9),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          const Expanded(
            child: Text(
              '认证通过，才能正常接单，平台会保护您的个人隐私',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF007DF9),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 认证卡片项
  Widget _buildVerifyItem({
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 80,
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 14),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF989898),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // 按钮
          InkWell(
            onTap: onTap,
            child: Container(
              width: 70,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFF007DF9),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return Container(
      color: const Color(0xFFF7F8FA),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildTipCard(),
            _buildVerifyItem(
              title: '身份证信息',
              subtitle: '上传本人身份证信息并完成人脸识别',
              buttonText: '去认证',
              onTap: () => Get.toNamed(RouteNames.idCardVerify),
            ),
            _buildVerifyItem(
              title: '驾驶证信息',
              subtitle: '认证本人驾驶证，保障正常接单',
              buttonText: '去上传',
              onTap: () => _showDriverLicenseUpload(),
            ),
            _buildVerifyItem(
              title: '车辆信息',
              subtitle: '核对本人车辆相关信息，完成审核',
              buttonText: '去完成',
              onTap: () => _showVehicleInfo(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // 显示身份证上传弹窗
  void _showIdCardUpload() {
    Get.bottomSheet(
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
                '上传身份证',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildPhotoUploadCard(
                        '身份证正面',
                        PhotoType.idCardFront,
                        controller.idCardFrontPhoto,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildPhotoUploadCard(
                        '身份证反面',
                        PhotoType.idCardBack,
                        controller.idCardBackPhoto,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.idCardFrontPhoto.value.isNotEmpty &&
                        controller.idCardBackPhoto.value.isNotEmpty) {
                      Get.back();
                      Get.snackbar('提示', '身份证信息已上传');
                    } else {
                      Get.snackbar('提示', '请上传完整的身份证照片');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF007DF9),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    '确认上传',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      isDismissible: true,
    );
  }

  // 显示驾驶证上传弹窗
  void _showDriverLicenseUpload() {
    Get.bottomSheet(
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
                '上传驾驶证',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildPhotoUploadCard(
                  '驾驶证照片',
                  PhotoType.driverLicense,
                  controller.driverLicensePhoto,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.driverLicensePhoto.value.isNotEmpty) {
                      Get.back();
                      Get.snackbar('提示', '驾驶证信息已上传');
                    } else {
                      Get.snackbar('提示', '请上传驾驶证照片');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF007DF9),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    '确认上传',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      isDismissible: true,
    );
  }

  // 显示车辆信息
  void _showVehicleInfo() {
    Get.snackbar('提示', '请先在"我的车库"中添加车辆信息');
  }

  // 照片上传卡片
  Widget _buildPhotoUploadCard(
    String label,
    PhotoType type,
    RxString photoPath,
  ) {
    return Obx(() {
      final hasPhoto = photoPath.value.isNotEmpty;

      return GestureDetector(
        onTap: () => controller.pickPhoto(type),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 140,
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8FA),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: hasPhoto
                      ? const Color(0xFF007DF9)
                      : const Color(0xFFE0E0E0),
                  width: 1.5,
                ),
              ),
              child: hasPhoto
                  ? Stack(
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image,
                                size: 50,
                                color: Colors.grey.shade400,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '已上传',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF007DF9),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Color(0xFF4CAF50),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 30,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '点击上传照片',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DriverVerifyController>(
      init: DriverVerifyController(),
      id: "driver_verify",
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
              '司机认证',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
          ),
          body: _buildView(),
        );
      },
    );
  }
}
