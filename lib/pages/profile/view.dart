import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  // 顶部导航栏
  Widget _buildAppBar() {
    return Container(
      height: 88,
      padding: EdgeInsets.only(
        top: MediaQuery.of(Get.context!).padding.top + 8,
        bottom: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 1,
            offset: const Offset(0, 0.5),
          ),
        ],
      ),
      child: Stack(
        children: [
          // 返回按钮
          Positioned(
            left: 12,
            top: MediaQuery.of(Get.context!).padding.top,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                width: 24,
                height: 24,
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                  color: Color(0xFF181818),
                ),
              ),
            ),
          ),
          // 标题
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(Get.context!).padding.top,
              ),
              child: const Text(
                '个人资料',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 信息项
  Widget _buildInfoItem({
    required String label,
    required String value,
    bool showArrow = false,
    bool isDisabled = false,
    VoidCallback? onTap,
  }) {
    Widget content = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isDisabled
                  ? const Color(0xFF1A1A1A)
                  : const Color(0xFF1B1B1B),
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: isDisabled
                  ? const Color(0xFF181818)
                  : const Color(0xFF9A9A9A),
            ),
          ),
          if (showArrow) ...[
            const SizedBox(width: 4),
            Transform.rotate(
              angle: 3.14159, // 180度
              child: const Icon(
                Icons.arrow_back_ios,
                size: 10,
                color: Color(0xFF111111),
              ),
            ),
          ],
        ],
      ),
    );

    if (onTap != null && !isDisabled) {
      return InkWell(
        onTap: onTap,
        child: content,
      );
    }
    return content;
  }

  // 个人信息卡片
  Widget _buildPersonalInfoCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF005FDD).withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题
          Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 8),
            child: Row(
              children: [
                Container(
                  width: 3,
                  height: 15,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF8BF9E0),
                        Color(0xFF39BACD),
                        Color(0xFF196ED8),
                      ],
                      stops: [0.0, 0.569, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  '个人信息',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),
          ),
          // 姓名
          _buildInfoItem(
            label: '姓名',
            value: '张三',
            isDisabled: true,
          ),
          const Divider(height: 1, color: Color(0xFFF6F6F6), indent: 24),
          // 手机号
          _buildInfoItem(
            label: '手机号',
            value: '138****8888',
            isDisabled: true,
          ),
          const Divider(height: 1, color: Color(0xFFF6F6F6), indent: 24),
          // 性别
          _buildInfoItem(
            label: '性别',
            value: '男',
            isDisabled: true,
          ),
          const Divider(height: 1, color: Color(0xFFF6F6F6), indent: 24),
          // 出生日期
          _buildInfoItem(
            label: '出生日期',
            value: '1990-01-01',
            isDisabled: true,
          ),
          const Divider(height: 1, color: Color(0xFFF6F6F6), indent: 24),
          // 身份证号
          _buildInfoItem(
            label: '身份证号',
            value: '510***********1234',
            isDisabled: true,
          ),
        ],
      ),
    );
  }

  // 车辆信息卡片
  Widget _buildVehicleInfoCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF005FDD).withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题
          Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 8),
            child: Row(
              children: [
                Container(
                  width: 3,
                  height: 15,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF8BF9E0),
                        Color(0xFF39BACD),
                        Color(0xFF196ED8),
                      ],
                      stops: [0.0, 0.569, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  '车辆信息',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),
          ),
          // 车牌号
          _buildInfoItem(
            label: '车牌号',
            value: '渝A7T673',
            isDisabled: true,
          ),
          const Divider(height: 1, color: Color(0xFFF6F6F6), indent: 24),
          // 燃料类别
          _buildInfoItem(
            label: '燃料类别',
            value: '请选择',
            showArrow: true,
            onTap: () {
              // TODO: 选择燃料类别
              Get.snackbar('提示', '选择燃料类别');
            },
          ),
          const Divider(height: 1, color: Color(0xFFF6F6F6), indent: 24),
          // 车辆类型
          _buildInfoItem(
            label: '车辆类型',
            value: '请选择',
            showArrow: true,
            onTap: () {
              // TODO: 选择车辆类型
              Get.snackbar('提示', '选择车辆类型');
            },
          ),
          const Divider(height: 1, color: Color(0xFFF6F6F6), indent: 24),
          // 车辆品牌
          _buildInfoItem(
            label: '车辆品牌',
            value: '请选择',
            showArrow: true,
            onTap: () {
              // TODO: 选择车辆品牌
              Get.snackbar('提示', '选择车辆品牌');
            },
          ),
          const Divider(height: 1, color: Color(0xFFF6F6F6), indent: 24),
          // 车辆型号
          _buildInfoItem(
            label: '车辆型号',
            value: '请选择',
            showArrow: true,
            onTap: () {
              // TODO: 选择车辆型号
              Get.snackbar('提示', '选择车辆型号');
            },
          ),
        ],
      ),
    );
  }

  // 保存按钮
  Widget _buildSaveButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFF348BFF),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFCCE2FF),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            controller.onSave();
          },
          borderRadius: BorderRadius.circular(24),
          child: const Center(
            child: Text(
              '保存',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 100), // 为顶部导航栏留出空间
          const SizedBox(height: 16),
          _buildPersonalInfoCard(),
          const SizedBox(height: 16),
          _buildVehicleInfoCard(),
          _buildSaveButton(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      id: "profile",
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              _buildView(),
              _buildAppBar(),
            ],
          ),
        );
      },
    );
  }
}
