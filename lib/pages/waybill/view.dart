import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class WaybillPage extends GetView<WaybillController> {
  const WaybillPage({super.key});

  // Tab栏
  Widget _buildTabBar() {
    return Container(
      height: 50,
      color: Colors.white,
      child: Row(
        children: List.generate(
          controller.tabs.length,
          (index) => Expanded(
            child: GestureDetector(
              onTap: () => controller.switchTab(index),
              child: Obx(() {
                final isSelected = controller.selectedTabIndex.value == index;
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: isSelected
                            ? const Color(0xFF007DF9)
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      controller.tabs[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                            isSelected ? FontWeight.w500 : FontWeight.normal,
                        color: isSelected
                            ? const Color(0xFF333333)
                            : const Color(0xFF989898),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  // 地图区域
  Widget _buildMapSection() {
    return Container(
      height: 280,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade100,
            Colors.blue.shade50,
          ],
        ),
      ),
      child: const Stack(
        children: [],
      ),
    );
  }

  // 城市标签
  Widget _buildCityLabel(String city) {
    return Text(
      city,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Color(0xFF333333),
      ),
    );
  }

  // 货源信息卡片
  Widget _buildCargoInfoCard() {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 装货时间信息
          Row(
            children: [
              const Icon(Icons.access_time, size: 15, color: Color(0xFF989898)),
              const SizedBox(width: 5),
              const Text(
                '9月20日 下午14:00装货',
                style: TextStyle(fontSize: 12, color: Color(0xFF989898)),
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFF007DF9),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  '待装货',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // 货物信息
          const Row(
            children: [
              Icon(Icons.inventory_2_outlined,
                  size: 15, color: Color(0xFF989898)),
              SizedBox(width: 5),
              Text(
                '饮料类 | 20吨 | 散装',
                style: TextStyle(fontSize: 12, color: Color(0xFF989898)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // 装货地状态
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF007DF9),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Center(
              child: Text(
                '到达出发地',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // 订单备注
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8FA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '订单备注',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333333),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  '9月27日 晚上19:00前送达',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF989898),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 路线信息卡片
  Widget _buildRouteCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
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
          const SizedBox(height: 14),
          // 起点
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '重庆-巴南区',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333333),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '大九公里街道办旁兴业物流园',
                      style: TextStyle(fontSize: 14, color: Color(0xFF989898)),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.location_on_outlined,
                    color: Color(0xFF007DF9)),
                onPressed: () =>
                    controller.viewLocation('重庆-巴南区 大九公里街道办旁兴业物流园'),
              ),
            ],
          ),
          // 虚线
          Container(
            margin: const EdgeInsets.only(left: 11),
            child: CustomPaint(
              size: const Size(1, 30),
              painter: DashedLinePainter(),
            ),
          ),
          // 终点
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '深圳-南山区',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333333),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '高新中一道2号长园新材料港4栋1楼',
                      style: TextStyle(fontSize: 14, color: Color(0xFF989898)),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.location_on_outlined,
                    color: Color(0xFF007DF9)),
                onPressed: () =>
                    controller.viewLocation('深圳-南山区 高新中一道2号长园新材料港4栋1楼'),
              ),
            ],
          ),
          const SizedBox(height: 14),
          // 运输信息
          Row(
            children: [
              Expanded(
                child: _buildInfoItem('离装货地', '12.5km'),
              ),
              Container(width: 1, height: 18, color: const Color(0xFFE6E6E6)),
              Expanded(
                child: _buildInfoItem('运输里程', '1772.8km'),
              ),
              Container(width: 1, height: 18, color: const Color(0xFFE6E6E6)),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '时效要求',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFF989898)),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '108',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF333333),
                              ),
                            ),
                            Text(
                              '小时',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF333333),
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
        ],
      ),
    );
  }

  // 信息项
  Widget _buildInfoItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF989898)),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF333333),
          ),
        ),
      ],
    );
  }

  // 货主信息卡片
  Widget _buildOwnerCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '货主信息',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              // 头像
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E0E0),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: const Icon(Icons.person, size: 30, color: Colors.white),
              ),
              const SizedBox(width: 12),
              // 信息
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '元老板',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333333),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '发货数762  好评率100%',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF989898),
                      ),
                    ),
                  ],
                ),
              ),
              // 操作按钮
              IconButton(
                icon: const Icon(Icons.phone, color: Color(0xFF007DF9)),
                onPressed: () => controller.callPhone(''),
              ),
              IconButton(
                icon: const Icon(Icons.message, color: Color(0xFF007DF9)),
                onPressed: () => controller.sendMessage(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 订单详情卡片
  Widget _buildOrderDetailCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildDetailRow('车辆', '6.8米厢式车'),
          const SizedBox(height: 14),
          _buildDetailRow('货物', '饮料类 | 20吨 | 散装'),
          const SizedBox(height: 14),
          _buildDetailRowWithCopy('运输单号', 'HY673784722464'),
          const SizedBox(height: 14),
          _buildDetailRow('运单运费', '¥8299/趟'),
          const SizedBox(height: 14),
          _buildDetailRow('运单奖金', '¥0'),
        ],
      ),
    );
  }

  // 详情行
  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Color(0xFF989898)),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF333333),
          ),
        ),
      ],
    );
  }

  // 带复制按钮的详情行
  Widget _buildDetailRowWithCopy(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Color(0xFF989898)),
        ),
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => controller.copyOrderNumber(value),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
        ),
      ],
    );
  }

  // 主视图
  Widget _buildView() {
    return Container(
      color: const Color(0xFFF7F8FA),
      child: Column(
        children: [
          _buildTabBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      _buildMapSection(),
                      const SizedBox(height: 170), // 为重叠的卡片留出空间
                      _buildRouteCard(),
                      _buildOwnerCard(),
                      _buildOrderDetailCard(),
                      const SizedBox(height: 20),
                    ],
                  ),
                  // 货源信息卡片向上覆盖地图
                  Positioned(
                    top: 200, // 调整这个值来控制重叠的程度
                    left: 0,
                    right: 0,
                    child: _buildCargoInfoCard(),
                  ),
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
    return GetBuilder<WaybillController>(
      init: WaybillController(),
      id: "waybill",
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('运单'),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
          ),
          body: SafeArea(
            child: _buildView(),
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
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 4;
    const dashSpace = 3;
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
