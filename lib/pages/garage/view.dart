import 'package:flutter/material.dart';
import 'package:flutter_freight/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class GaragePage extends GetView<GarageController> {
  const GaragePage({super.key});

  // 车辆列表
  Widget _buildVehicleList() {
    return Obx(() => ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: controller.vehicleList.length,
          itemBuilder: (context, index) {
            final vehicle = controller.vehicleList[index];
            return _buildVehicleItem(vehicle, index);
          },
        ));
  }

  // 单个车辆项
  Widget _buildVehicleItem(VehicleItem vehicle, int index) {
    return Container(
      width: 345,
      height: 145,
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // 上半部分：车辆信息
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 车辆图片
                  Container(
                    width: 77,
                    height: 77,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        AssetsImages.chePng,
                        width: 102,
                        height: 77,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // 车辆信息
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 车牌号
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
                            mainAxisSize: MainAxisSize.min,
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
                                child: Center(
                                  child: Text(
                                    vehicle.plateProvince,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                child: Text(
                                  vehicle.plateNumber,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        // 品牌信息
                        Text(
                          '品牌：${vehicle.brand} ${vehicle.model} ${vehicle.type}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF676767),
                          ),
                        ),
                        const SizedBox(height: 4),
                        // 道路运输证有效期
                        Text(
                          '道路运输证有效期：${vehicle.registrationDate}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF676767),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 分隔线
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: 14),
            color: const Color(0xFFEAEAEA),
          ),
          // 底部操作栏
          SizedBox(
            height: 44,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  // 选择框
                  InkWell(
                    onTap: () => controller.setDefaultVehicle(index),
                    child: Row(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: vehicle.isDefault
                                ? const Color(0xFF007DF9)
                                : Colors.white,
                            border: Border.all(
                              color: vehicle.isDefault
                                  ? const Color(0xFF007DF9)
                                  : const Color(0xFF989898),
                              width: 1,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: vehicle.isDefault
                              ? const Icon(
                                  Icons.check,
                                  size: 10,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '默认车辆',
                          style: TextStyle(
                            fontSize: 12,
                            color: vehicle.isDefault
                                ? const Color(0xFF333333)
                                : const Color(0xFF676767),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // 编辑按钮
                  InkWell(
                    onTap: () => controller.editVehicle(vehicle),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.edit_outlined,
                          size: 17,
                          color: Color(0xFF989898),
                        ),
                        SizedBox(width: 4),
                        Text(
                          '编辑',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF676767),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  // 删除按钮
                  InkWell(
                    onTap: () => controller.deleteVehicle(vehicle),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.delete_outline,
                          size: 17,
                          color: Color(0xFF989898),
                        ),
                        SizedBox(width: 4),
                        Text(
                          '删除',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF676767),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 底部添加按钮
  Widget _buildBottomButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: ElevatedButton(
          onPressed: () => controller.addVehicle(),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF007DF9),
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            minimumSize: const Size(double.infinity, 52),
          ),
          child: const Text(
            '添加车辆',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: const Color(0xFFF7F8FA),
            child: _buildVehicleList(),
          ),
        ),
        _buildBottomButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GarageController>(
      init: GarageController(),
      id: "garage",
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
              '我的车库',
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
