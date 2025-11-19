import 'package:flutter/material.dart';
import 'package:flutter_freight/common/index.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'index.dart';

class GrabbPage extends GetView<GrabbController> {
  const GrabbPage({super.key});

  // 顶部导航栏
  Widget _buildAppBar() {
    return Container(
      height: 88,
      padding: EdgeInsets.only(
        top: MediaQuery.of(Get.context!).padding.top,
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
              child: const SizedBox(
                width: 24,
                height: 24,
                child: Icon(
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
                '运单市场',
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

  // 标签切换
  Widget _buildTabs() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          _buildTab('今天', 0),
          const SizedBox(width: 10),
          _buildTab('明天', 1),
          const SizedBox(width: 10),
          _buildTab('后天', 2),
          const Spacer(),
          // 筛选按钮
          GestureDetector(
            onTap: () {
              _showFilterBottomSheet();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '筛选',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset(
                    'assets/svgs/icon_filter.svg',
                    width: 13,
                    height: 13,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    return Obx(() {
      final isSelected = controller.selectedTabIndex.value == index;
      return GestureDetector(
        onTap: () {
          controller.selectedTabIndex.value = index;
        },
        child: Container(
          width: 70,
          height: 30,
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF348BFF)
                : const Color(0xFF348BFF).withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: isSelected ? Colors.white : const Color(0xFF348BFF),
              ),
            ),
          ),
        ),
      );
    });
  }

  // 运单卡片
  Widget _buildOrderCard({
    required String from,
    required String to,
    required List<String> tags,
    required String price,
    required String route,
    required String status,
    bool showStatus = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(12),
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
          // 标题行
          Row(
            children: [
              Text(
                from,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const BgTextWidget(
                text: '货',
                textStyle: TextStyle(
                  fontSize: 10,
                  color: Color(0xFF016EFD), //016EFD
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                to,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const Spacer(),
              if (showStatus)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEA981B),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '副',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffffffff),
                        ),
                      ),
                      const SizedBox(width: 4),
                      SvgPicture.asset(
                        'assets/svgs/icon_switch.svg',
                        width: 16,
                        height: 16,
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          // 标签
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags.map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFEA981B).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFEA981B),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          // 路线信息区域
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F9FF),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: const BoxDecoration(
                        color: Color(0xFF348BFF),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '重庆市渝北区',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEA981B),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '2',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '深圳市南山区',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: const BoxDecoration(
                        color: Color(0xFF348BFF),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        route,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF348BFF),
                        ),
                      ),
                    ),
                    // 定位图标
                    SvgPicture.asset(
                      'assets/svgs/icon_location.svg',
                      width: 13,
                      height: 13,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // 价格和接单按钮
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        '¥',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFF092C),
                        ),
                      ),
                      Text(
                        price,
                        style: const TextStyle(
                          fontFamily: 'DIN',
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFF092C),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Container(
                width: 100,
                height: 34,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF348BFF),
                      Color(0xFF348BFF),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFCCE2FF),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      // TODO: 接单
                      Get.snackbar('提示', '接单成功');
                    },
                    borderRadius: BorderRadius.circular(18),
                    child: const Center(
                      child: Text(
                        '抢单',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 运单列表
  Widget _buildOrderList() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildOrderCard(
            from: '重庆',
            to: '深圳',
            tags: ['4.2米', '6.8米', '厢式', '平板'],
            price: '8299',
            route: '重庆市渝北区 → 深圳市南山区',
            status: '进行中',
            showStatus: true,
          ),
          _buildOrderCard(
            from: '重庆',
            to: '福建',
            tags: ['9.6米', '厢式', '高栏'],
            price: '6680',
            route: '重庆市渝北区 → 福建省福州市',
            status: '进行中',
            showStatus: true,
          ),
        ],
      ),
    );
  }

  // 显示筛选弹窗
  void _showFilterBottomSheet() {
    // 使用 Map 来管理每个分组的选中项（支持单选）
    final selectedFilters = <String, String?>{
      '选择日期': null,
      '装卸地': null,
      '还柜口岸': null,
      '柜型': null,
    };

    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  // 标题栏
                  Container(
                    height: 56,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: const Color(0xFFE5E5E5).withOpacity(0.5),
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '筛选',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1A1A1A),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right: 0,
                          child: GestureDetector(
                            onTap: () => Get.back(),
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              child: const Icon(
                                Icons.close,
                                size: 20,
                                color: Color(0xFF999999),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 筛选内容
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 选择日期
                          _buildFilterSection(
                            title: '选择日期',
                            selectedValue: selectedFilters['选择日期'],
                            setState: setState,
                            onSelected: (value) {
                              selectedFilters['选择日期'] = value;
                            },
                            children: [
                              '今天',
                              '明天',
                              '后天',
                            ],
                          ),
                          const SizedBox(height: 24),
                          // 装卸地
                          _buildFilterSection(
                            title: '装卸地',
                            selectedValue: selectedFilters['装卸地'],
                            setState: setState,
                            onSelected: (value) {
                              selectedFilters['装卸地'] = value;
                            },
                            children: [
                              '深圳市',
                              '广州市',
                              '东莞市',
                            ],
                          ),
                          const SizedBox(height: 24),
                          // 还柜口岸
                          _buildFilterSection(
                            title: '还柜口岸',
                            selectedValue: selectedFilters['还柜口岸'],
                            setState: setState,
                            onSelected: (value) {
                              selectedFilters['还柜口岸'] = value;
                            },
                            children: [
                              '盐田口岸',
                              '深圳口岸',
                              '盐田口岸',
                              '罗湖口岸',
                              '龙岗口岸',
                              '深圳口岸',
                              '盐田口岸',
                              '罗湖口岸',
                              '漳州口岸',
                              '上海口岸',
                            ],
                          ),
                          const SizedBox(height: 24),
                          // 柜型
                          _buildFilterSection(
                            title: '柜型',
                            selectedValue: selectedFilters['柜型'],
                            setState: setState,
                            onSelected: (value) {
                              selectedFilters['柜型'] = value;
                            },
                            children: [
                              '40QH',
                              '42QQ',
                              '36QK',
                              '52QP',
                              '24KL',
                              '23JM',
                              '11YM',
                              '89HK',
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 底部按钮
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedFilters.forEach((key, value) {
                                  selectedFilters[key] = null;
                                });
                              });
                            },
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color(0xFFE5E5E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: const Center(
                                child: Text(
                                  '重置',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF666666),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {
                              // TODO: 应用筛选
                              Get.back();
                              Get.snackbar('提示', '筛选已应用');
                            },
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF348BFF),
                                    Color(0xFF348BFF),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF348BFF)
                                        .withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  '确定',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // 筛选分组
  Widget _buildFilterSection({
    required String title,
    required String? selectedValue,
    required StateSetter setState,
    required Function(String?) onSelected,
    required List<String> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1A1A),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 12,
          children: children.map((label) {
            final isSelected = selectedValue == label;
            return _buildFilterChip(
              label,
              isSelected,
              () {
                setState(() {
                  onSelected(isSelected ? null : label);
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  // 筛选标签
  Widget _buildFilterChip(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF348BFF).withOpacity(0.08)
              : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? const Color(0xFF348BFF) : Colors.transparent,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color:
                isSelected ? const Color(0xFF348BFF) : const Color(0xFF666666),
          ),
        ),
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        _buildAppBar(),
        _buildTabs(),
        _buildOrderList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GrabbController>(
      init: GrabbController(),
      id: "grabb",
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: _buildView(),
        );
      },
    );
  }
}
