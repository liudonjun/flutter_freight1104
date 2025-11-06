import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../common/index.dart';
import 'index.dart';

class RoadsideAssistancePage extends GetView<RoadsideAssistanceController> {
  const RoadsideAssistancePage({super.key});

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
        '道路救援',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Color(0xFF333333),
        ),
      ),
      centerTitle: true,
    );
  }

  // 服务类型选择
  Widget _buildServiceTypes() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            controller.serviceTypes.length,
            (index) => GestureDetector(
              onTap: () => controller.selectServiceType(index),
              child: Container(
                width: index == 4 ? 73 : 60,
                height: 34,
                decoration: BoxDecoration(
                  color: controller.selectedServiceIndex.value == index
                      ? const Color(0xFF007DF9)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    controller.serviceTypes[index],
                    style: TextStyle(
                      fontSize: 16,
                      color: controller.selectedServiceIndex.value == index
                          ? Colors.white
                          : const Color(0xFF333333),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 表单卡片
  Widget _buildFormCard1() {
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
          // 救援位置
          Row(
            children: [
              const Text(
                '*救援位置',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: controller.selectLocation,
                child: Obx(
                  () => Text(
                    controller.rescueLocation.value.isEmpty
                        ? '天鸿大道附近'
                        : controller.rescueLocation.value,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.chevron_right,
                size: 13,
                color: Color(0xFF999999),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(height: 1, color: const Color(0xFFEAEAEA)),
          const SizedBox(height: 16),
          // 车辆类型
          Row(
            children: [
              const Text(
                '*车辆类型',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: controller.selectVehicleType,
                child: Obx(
                  () => Text(
                    controller.vehicleType.value.isEmpty
                        ? '半挂车'
                        : controller.vehicleType.value,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.chevron_right,
                size: 13,
                color: Color(0xFF999999),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 车牌号输入卡片
  Widget _buildFormCard2() {
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
            '*车牌号码',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          // 车牌输入区域
          Row(
            children: [
              // 省份选择
              GestureDetector(
                onTap: controller.selectProvince,
                child: Container(
                  width: 36,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF007DF9).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => Text(
                          controller.province.value,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF007DF9),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        size: 12,
                        color: Color(0xFF007DF9),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 4),
              // 车牌号输入框（7个字符）
              ...List.generate(7, (index) {
                return Row(
                  children: [
                    Container(
                      width: 35,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: index == 0
                              ? const Color(0xFF007DF9)
                              : const Color(0xFFCBCBCB),
                          width: 0.6,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Center(
                        child: Text(
                          '',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF333333),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                  ],
                );
              }),
              // 新能源按钮
              GestureDetector(
                onTap: controller.toggleNewEnergy,
                child: Obx(
                  () => Container(
                    width: 35,
                    height: 48,
                    decoration: BoxDecoration(
                      color: controller.isNewEnergy.value
                          ? const Color(0xFF007DF9).withOpacity(0.1)
                          : Colors.white,
                      border: Border.all(
                        color: controller.isNewEnergy.value
                            ? const Color(0xFF007DF9)
                            : const Color(0xFFCBCBCB),
                        width: 0.6,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        '新\n能\n源',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: controller.isNewEnergy.value
                              ? const Color(0xFF007DF9)
                              : const Color(0xFF989898),
                          height: 1.3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(height: 1, color: const Color(0xFFEAEAEA)),
          const SizedBox(height: 16),
          // 联系电话
          Row(
            children: [
              const Text(
                '*联系电话',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333),
                ),
              ),
              const Spacer(),
              const SizedBox(
                width: 150,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '请输入联系电话',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF989898),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(height: 1, color: const Color(0xFFEAEAEA)),
          const SizedBox(height: 16),
          // 车辆品牌
          Row(
            children: [
              const Text(
                '*车辆品牌',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333),
                ),
              ),
              const Spacer(),
              const SizedBox(
                width: 150,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '请输入车辆品牌',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF989898),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 服务条款
  Widget _buildTerms() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '申请该服务，即表示已阅读并同意',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF666666),
            ),
          ),
          GestureDetector(
            onTap: () {
              // TODO: 查看服务条款
            },
            child: const Text(
              '《道路救援服务条款》',
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

  // 底部价格和按钮
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '预估：',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF343434),
                      ),
                    ),
                    Obx(
                      () => Text(
                        controller.estimatedPrice.value,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF343434),
                          fontFamily: 'DIN',
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '元起',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF343434),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: controller.viewPriceDescription,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.info_outline,
                        size: 12,
                        color: Color(0xFF676767),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '查看收费说明',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF676767),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: controller.callNow,
            child: Container(
              width: 160,
              height: 46,
              decoration: BoxDecoration(
                color: const Color(0xFF007DF9),
                borderRadius: BorderRadius.circular(23),
              ),
              child: const Center(
                child: Text(
                  '立即呼叫',
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
    return GetBuilder<RoadsideAssistanceController>(
      init: RoadsideAssistanceController(),
      id: "roadside_assistance",
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
                      _buildServiceTypes(),
                      _buildFormCard1(),
                      _buildFormCard2(),
                      _buildTerms(),
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
