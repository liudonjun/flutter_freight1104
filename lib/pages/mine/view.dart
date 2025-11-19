import 'package:flutter/material.dart';
import 'package:flutter_freight/common/index.dart';
import 'package:flutter_freight/pages/garage/index.dart';
import 'package:flutter_freight/pages/driver_verify/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class MinePage extends GetView<MineController> {
  const MinePage({super.key});

  // 顶部背景和用户信息
  Widget _buildHeader() {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: Colors.black,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFFB1D9F9).withOpacity(0.9),
            const Color(0xFFB2DAFC).withOpacity(0.0001),
          ],
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            // 装饰圆形
            Positioned(
              right: -50,
              top: -60,
              child: Container(
                width: 329,
                height: 196,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.16),
                      Colors.white.withOpacity(0.0001),
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // 设置按钮
            Positioned(
              right: 15,
              top: 12,
              child: IconButton(
                onPressed: () => Get.snackbar('提示', '设置'),
                icon: const Icon(
                  Icons.settings_outlined,
                  color: Color(0xFF333333),
                  size: 20,
                ),
              ),
            ),
            // 用户信息
            Positioned(
              left: 15,
              top: 50,
              child: Row(
                children: [
                  // 头像
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteNames.profile);
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF0056AA).withOpacity(0.04),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 35,
                        color: Color(0xFF999999),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // 手机号和认证状态
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => Text(
                            controller.userPhone.value,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF333333),
                            ),
                          )),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          // 认证标签
                          Container(
                            height: 18,
                            padding: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: const Color(0xFF007DF9)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 26,
                                  height: 18,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF007DF9),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.check,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Text(
                                  '未认证',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF007DF9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          // LV2 标签
                          Container(
                            height: 18,
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xFF989898), width: 0.6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'LV2',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF989898),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 余额和接单卡片
  Widget _buildBalanceCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          // 余额卡片
          Expanded(
            child: Container(
              height: 90,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '我的余额（元）',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF989898),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text(
                        '6845.98',
                        style: TextStyle(
                          fontFamily: 'DIN',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF333333),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFF007DF9),
                            width: 0.6,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              '提现',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF007DF9),
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.chevron_right,
                              size: 14,
                              color: Color(0xFF007DF9),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 13),
          // 接单卡片
          Container(
            width: 102,
            height: 90,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      '本月接单',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF989898),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.chevron_right,
                      size: 11,
                      color: Color(0xFF989898),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  '26',
                  style: TextStyle(
                    fontFamily: 'DIN',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF333333),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 我的车库卡片
  Widget _buildGarageCard() {
    return GestureDetector(
      onTap: () => Get.to(() => const GaragePage()),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        height: 140,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  '我的车库',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333333),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Get.to(() => const GaragePage()),
                  child: Row(
                    children: const [
                      Text(
                        '管理车辆',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF989898),
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.add_circle_outline,
                        size: 15,
                        color: Color(0xFF989898),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '中国一汽 J7经典版 8×4载货',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF989898),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // 车牌号
                      Row(
                        children: [
                          Container(
                            height: 21,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF007DF9),
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 21,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF007DF9),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      bottomLeft: Radius.circular(4),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '渝',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  child: Text(
                                    'A7T673',
                                    style: TextStyle(
                                      fontSize: 15,
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
                    ],
                  ),
                ),
                // 车辆图片
                Image.asset(
                  AssetsImages.chePng,
                  width: 108,
                  height: 72,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 功能菜单列表
  Widget _buildMenuList() {
    final menuItems = [
      {'icon': Icons.person_outline, 'title': '司机认证'},
      {'icon': Icons.account_balance_wallet_outlined, 'title': '我的钱包'},
      {'icon': Icons.receipt_long_outlined, 'title': '我的票据'},
      {'icon': Icons.school_outlined, 'title': '教学培训'},
      {'icon': Icons.feedback_outlined, 'title': '投诉与建议'},
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: menuItems.length,
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Divider(height: 1, color: Color(0xFFF0F0F0)),
        ),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return InkWell(
            onTap: () {
              if (index == 0) {
                // 司机认证
                Get.to(() => const DriverVerifyPage());
              } else {
                controller.onMenuTap(index);
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              child: Row(
                children: [
                  Icon(
                    item['icon'] as IconData,
                    size: 21,
                    color: const Color(0xFF333333),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    item['title'] as String,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.chevron_right,
                    size: 13,
                    color: Color(0xFF989898),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return Container(
      color: const Color(0xFFF7F8FA),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Transform.translate(
                    offset: const Offset(0, -46),
                    child: Column(
                      children: [
                        const SizedBox(height: 14),
                        _buildBalanceCards(),
                        const SizedBox(height: 14),
                        _buildGarageCard(),
                        const SizedBox(height: 14),
                        _buildMenuList(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineController>(
      init: MineController(),
      id: "mine",
      builder: (_) {
        return Scaffold(
          backgroundColor: const Color(0xFFF7F8FA),
          body: _buildView(),
        );
      },
    );
  }
}
