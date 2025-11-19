import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/index.dart';
import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  // 顶部区域
  Widget _buildHeader() {
    return Container(
      // height: 88,
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            // 城市选择
            const Row(
              children: [
                Text(
                  '重庆市',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333333),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                  color: Color(0xFF333333),
                ),
              ],
            ),
            const SizedBox(width: 16),
            // 搜索框
            Expanded(
              child: Container(
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 16),
                    Icon(
                      Icons.search,
                      size: 16,
                      color: Color(0xFF989898),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '想了解点什么',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF989898),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            // 消息图标
            Stack(
              children: [
                const Icon(
                  Icons.notifications_none,
                  size: 24,
                  color: Color(0xFF333333),
                ),
                Positioned(
                  right: 2,
                  top: 2,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEA5F5A),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Banner
  Widget _buildBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          AssetsImages.homeBannerPng,
          width: double.infinity,
          height: 130,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 功能网格
  Widget _buildFunctionGrid() {
    final functions = [
      {'icon': AssetsImages.orderHallPng, 'title': '抢单大厅'},
      {'icon': AssetsImages.violationQueryPng, 'title': '违章查询'},
      {'icon': AssetsImages.vehicleMaintenancePng, 'title': '汽车检修'},
      {'icon': AssetsImages.roadsideAssistancePng, 'title': '道路救援'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: functions.map((item) {
          return _buildFunctionItem(item['icon']!, item['title']!);
        }).toList(),
      ),
    );
  }

  Widget _buildFunctionItem(String iconPath, String title) {
    return GestureDetector(
      onTap: () {
        // 根据标题跳转到不同页面
        switch (title) {
          case '道路救援':
            Get.toNamed(RouteNames.roadsideAssistance);
            break;
          case '抢单大厅':
            Get.toNamed(RouteNames.grabb);
            break;
          case '违章查询':
            // TODO: 跳转到违章查询
            break;
          case '汽车检修':
            // TODO: 跳转到汽车检修
            break;
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                iconPath,
                width: 55,
                height: 55,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF333333),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 卡片功能
  Widget _buildCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: Row(
        children: [
          // 招募司机卡片
          Expanded(
            child: Container(
              height: 79,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFD2E7FE), Color(0xFFE7F3FF)],
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '招募司机',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF333333),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '福利政策等你来',
                          style: TextStyle(
                            fontSize: 12,
                            color: const Color(0xFF333333).withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 图片
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      AssetsImages.recruitDriverPng,
                      width: 66,
                      height: 71,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 13),
          // 安全知识卡片
          Expanded(
            child: Container(
              height: 79,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFFFE1E3), Color(0xFFFFF0F1)],
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '安全知识',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF333333),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '如何保障自身安全',
                          style: TextStyle(
                            fontSize: 12,
                            color: const Color(0xFF333333).withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 图片
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      AssetsImages.safetyKnowledgePng,
                      width: 61,
                      height: 70,
                      fit: BoxFit.contain,
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

  // 接单货源标题
  Widget _buildSectionTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '接单货源',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: 72,
                height: 4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF007DF9),
                      const Color(0xFF007DF9).withOpacity(0),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 筛选标签
  Widget _buildFilterTabs() {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          // 可滚动的标签区域
          Expanded(
            child: Stack(
              children: [
                // 滚动列表
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 15, right: 20),
                  child: Row(
                    children: [
                      _buildTab('智能推荐', true),
                      const SizedBox(width: 10),
                      _buildTab('距离最近', false),
                      const SizedBox(width: 10),
                      _buildTab('价格最优', false),
                      const SizedBox(width: 10),
                      _buildTab('时间优先', false),
                      const SizedBox(width: 10),
                      _buildTab('装货时间', false),
                      const SizedBox(width: 10),
                      _buildTab('卸货时间', false),
                    ],
                  ),
                ),
                // 右侧渐变遮罩
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          const Color(0xFFF7F8FA).withOpacity(0),
                          const Color(0xFFF7F8FA),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 固定的筛选图标
          Container(
            padding: const EdgeInsets.only(right: 15, left: 8),
            child: const Icon(
              Icons.tune,
              size: 20,
              color: Color(0xFF333333),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, bool isSelected) {
    return Container(
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFF007DF9).withOpacity(0.1)
            : Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
            color:
                isSelected ? const Color(0xFF007DF9) : const Color(0xFF333333),
          ),
        ),
      ),
    );
  }

  // 货源列表
  Widget _buildOrderList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              _buildOrderCard(
                from: '重庆',
                to: '深圳',
                distance: '距离12km',
                carSize: '4.2/6.8米',
                carType: '厢式/平板',
                loadTime: '9月20日 下午14:00装货',
                cargoInfo: '饮料类 | 20吨 | 散装',
                price: '8299',
                badge: '+3',
              ),
              const SizedBox(height: 14),
              _buildOrderCard(
                from: '重庆',
                to: '福建',
                distance: '距离56km',
                carSize: '9.6米',
                carType: '厢式/高栏',
                loadTime: '9月22日 下午18:00装货',
                cargoInfo: '水果类 | 40吨 | 盒装',
                price: '6680',
                badge: '+2',
              ),
              const SizedBox(height: 14),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOrderCard({
    required String from,
    required String to,
    required String distance,
    required String carSize,
    required String carType,
    required String loadTime,
    required String cargoInfo,
    required String price,
    required String badge,
  }) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteNames.cargoDetail);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 起点终点
                Row(
                  children: [
                    Text(
                      from,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: Color(0xFF989898),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      to,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      distance,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF989898),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 11),
                // 车型标签
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF007DF9), width: 0.6),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                        carSize,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF007DF9),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFFFF7124), width: 0.6),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                        carType,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFFFF7124),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // 图片和详情
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 货车图片占位
                    Stack(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.local_shipping,
                            size: 40,
                            color: Color(0xFFCCCCCC),
                          ),
                        ),
                        if (badge.isNotEmpty)
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(6),
                                ),
                              ),
                              child: Text(
                                badge,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(width: 15),
                    // 详情信息
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                size: 15,
                                color: Color(0xFF989898),
                              ),
                              const SizedBox(width: 3),
                              Text(
                                loadTime,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF989898),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 11),
                          Row(
                            children: [
                              const Icon(
                                Icons.inventory_2_outlined,
                                size: 15,
                                color: Color(0xFF989898),
                              ),
                              const SizedBox(width: 3),
                              Text(
                                cargoInfo,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF989898),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 11),
                          // 价格和按钮
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                '¥',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFE8573D),
                                ),
                              ),
                              Text(
                                price,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFE8573D),
                                ),
                              ),
                              const Text(
                                '元/趟',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF989898),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 68,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF007DF9),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                  child: Text(
                                    '接单',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
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
          ),
          // Badge在右上角
        ],
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return Stack(
      children: [
        // 背景图片
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            AssetsImages.bgHomePng,
            width: double.infinity,
            height: 220,
            fit: BoxFit.cover,
          ),
        ),
        // 内容区域
        Column(
          children: [
            // 添加状态栏高度的间距
            SizedBox(height: MediaQuery.of(Get.context!).padding.top),
            // 固定顶部搜索栏
            _buildHeader(),
            // 可滚动内容区域
            Expanded(
              child: SmartRefresher(
                controller: controller.refreshController,
                enablePullDown: true,
                enablePullUp: true,
                onRefresh: controller.onRefresh,
                onLoading: controller.onLoading,
                header: WaterDropMaterialHeader(
                  backgroundColor: Color(0xFF007DF9),
                  color: Colors.white,
                ),
                footer: CustomFooter(
                  builder: (BuildContext context, LoadStatus? mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = const Text("上拉加载更多");
                    } else if (mode == LoadStatus.loading) {
                      body = const CircularProgressIndicator();
                    } else if (mode == LoadStatus.failed) {
                      body = const Text("加载失败！点击重试！");
                    } else if (mode == LoadStatus.canLoading) {
                      body = const Text("松手开始加载");
                    } else {
                      body = const Text("没有更多数据了");
                    }
                    return Container(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildBanner(),
                      _buildFunctionGrid(),
                      _buildCards(),
                      _buildSectionTitle(),
                      _buildFilterTabs(),
                      _buildOrderList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: "home",
      builder: (_) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            backgroundColor: const Color(0xFFF7F8FA),
            extendBodyBehindAppBar: true,
            body: _buildView(),
          ),
        );
      },
    );
  }
}
