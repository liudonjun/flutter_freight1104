import 'package:flutter/material.dart';
import 'package:flutter_freight/pages/schedule/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class CargoDetailPage extends GetView<CargoDetailController> {
  const CargoDetailPage({super.key});

  // 顶部导航栏
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios,
            color: Color(0xFF333333), size: 20),
        onPressed: () => Get.back(),
      ),
      title: const Text(
        '货源详情',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Color(0xFF333333),
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.share, color: Color(0xFF333333), size: 20),
          onPressed: controller.share,
        ),
      ],
    );
  }

  // 顶部保障信息
  Widget _buildGuaranteeBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF007DF9).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.verified_user,
            size: 17,
            color: Color(0xFF007DF9),
          ),
          const SizedBox(width: 6),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: '运费平台保障  | ',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF007DF9),
                  ),
                ),
                TextSpan(
                  text: '平台结算,保障个人权益',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF007DF9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 货源信息卡片
  Widget _buildCargoInfoCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '货源信息',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Get.to(() => SchedulePage());
            },
            child: Text(
              '装货时间:${controller.state.loadingTime}',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF333333),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Container(height: 1, color: const Color(0xFFEAEAEA)),
          const SizedBox(height: 14),
          // 起始地
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 23,
                    height: 22,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2D60FE),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(
                      child: Text(
                        '寄',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 70,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: CustomPaint(
                      painter: DashedLinePainter(),
                    ),
                  ),
                  Container(
                    width: 23,
                    height: 22,
                    decoration: BoxDecoration(
                      color: const Color(0xFF333333),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(
                      child: Text(
                        '卸',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.state.originCity,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      controller.state.originAddress,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF989898),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      controller.state.destinationCity,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      controller.state.destinationAddress,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF989898),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: controller.viewOriginLocation,
                    child: const Icon(
                      Icons.location_on_outlined,
                      size: 22,
                      color: Color(0xFF007DF9),
                    ),
                  ),
                  const SizedBox(height: 58),
                  GestureDetector(
                    onTap: controller.viewDestinationLocation,
                    child: const Icon(
                      Icons.location_on_outlined,
                      size: 22,
                      color: Color(0xFF007DF9),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // 蓝色背景信息区
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF007DF9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      controller.state.distanceFromOrigin,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: 'DIN',
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '离装货地',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 1,
                  height: 18,
                  color: Colors.white.withOpacity(0.3),
                ),
                Column(
                  children: [
                    Text(
                      controller.state.totalDistance,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: 'DIN',
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '运输里程',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 1,
                  height: 18,
                  color: Colors.white.withOpacity(0.3),
                ),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          controller.state.timeRequirement,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: 'DIN',
                          ),
                        ),
                        const Text(
                          '小时',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '时效要求',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 货源详情卡片
  Widget _buildCargoDetailCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '货源详情',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          _buildDetailRow('车辆', controller.state.vehicleType,
              controller.state.vehicleStyle),
          const SizedBox(height: 16),
          _buildDetailRow('货物', controller.state.cargoType, null),
          const SizedBox(height: 16),
          _buildDetailRow('运输单号', controller.state.orderNumber, null,
              showCopy: true),
          const SizedBox(height: 16),
          _buildDetailRow('运单运费', '¥${controller.state.freight}/趟', null),
          const SizedBox(height: 16),
          _buildDetailRow('运单奖金', '¥${controller.state.bonus}', null),
        ],
      ),
    );
  }

  // 详情行
  Widget _buildDetailRow(String label, String value, String? tag,
      {bool showCopy = false}) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF989898),
          ),
        ),
        const Spacer(),
        if (label == '车辆') ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF007DF9), width: 0.6),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF007DF9),
              ),
            ),
          ),
          if (tag != null) const SizedBox(width: 6),
          if (tag != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFFF7124), width: 0.6),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Text(
                tag,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFFFF7124),
                ),
              ),
            ),
        ] else ...[
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
            ),
          ),
          if (showCopy) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: controller.copyOrderNumber,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xFFCDCDCD), width: 0.6),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  '复制',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
            ),
          ],
        ],
      ],
    );
  }

  // 底部按钮栏
  Widget _buildBottomBar() {
    return Container(
      height: 88,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      '¥',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFE8573D),
                        fontFamily: 'DIN',
                      ),
                    ),
                    Text(
                      controller.state.freight,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFE8573D),
                        fontFamily: 'DIN',
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '元/趟',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF989898),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: controller.grabOrder,
            child: Container(
              width: 229,
              height: 46,
              decoration: BoxDecoration(
                color: const Color(0xFF007DF9),
                borderRadius: BorderRadius.circular(23),
              ),
              child: const Center(
                child: Text(
                  '立即抢单',
                  style: TextStyle(
                    fontSize: 16,
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

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CargoDetailController>(
      init: CargoDetailController(),
      id: "cargo_detail",
      builder: (_) {
        return Scaffold(
          backgroundColor: const Color(0xFFF7F8FA),
          appBar: _buildAppBar(),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildGuaranteeBanner(),
                      _buildCargoInfoCard(),
                      _buildCargoDetailCard(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              _buildBottomBar(),
            ],
          ),
        );
      },
    );
  }
}

// 虚线绘制器
class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF989898)
      ..strokeWidth = 1;

    const dashWidth = 4.0;
    const dashSpace = 3.0;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
