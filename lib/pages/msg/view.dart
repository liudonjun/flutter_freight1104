import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_freight/pages/custom_service/index.dart';
import 'package:flutter_freight/pages/schedule/index.dart';
import 'package:get/get.dart';

import '../../common/index.dart';
import 'index.dart';

class MsgPage extends GetView<MsgController> {
  const MsgPage({super.key});

  // 顶部背景
  Widget _buildTopBackground() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Image.asset(
        AssetsImages.bgHomePng,
        width: double.infinity,
        height: 220,
        fit: BoxFit.cover,
      ),
    );
  }

  // 顶部标题栏
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.only(
        top: 8,
        left: 15,
        right: 15,
        bottom: 8,
      ),
      child: Row(
        children: [
          const Text(
            '消息',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
            ),
          ),
          const Spacer(),
          // 更多按钮（三个点）
          GestureDetector(
            onTap: () {
              // TODO: 显示更多菜单
            },
            child: Container(
              width: 20,
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 3.5,
                    height: 3.5,
                    decoration: const BoxDecoration(
                      color: Color(0xFF333333),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 3.5,
                    height: 3.5,
                    decoration: const BoxDecoration(
                      color: Color(0xFF333333),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 3.5,
                    height: 3.5,
                    decoration: const BoxDecoration(
                      color: Color(0xFF333333),
                      shape: BoxShape.circle,
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

  // 客服助手和日程安排按钮
  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          // 客服助手按钮
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.to(() => const CustomServicePage());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFF6FB8FF),
                      Color(0xFF007DF9),
                    ],
                    stops: [-0.0265, 1.0406],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 客服图标
                    const Icon(
                      Icons.headset_mic,
                      size: 18,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      '客服助手',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 13),
          // 日程安排按钮
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.to(() => const SchedulePage());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFFFF9F6B),
                      Color(0xFFFF7124),
                    ],
                    stops: [-0.0437, 1.0339],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 日程图标
                    const Icon(
                      Icons.calendar_today,
                      size: 18,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      '日程安排',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 消息列表项
  Widget _buildMessageItem({
    required String title,
    required String content,
    required String time,
    required int? unreadCount,
    required bool isSystem,
    String? avatarUrl,
    String? badge,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 头像或图标
              if (isSystem)
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF007DF9).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      title == '运单状态提醒'
                          ? Icons.local_shipping
                          : Icons.notifications,
                      size: 24,
                      color: const Color(0xFF007DF9),
                    ),
                  ),
                )
              else
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: avatarUrl != null
                      ? ClipOval(
                          child: Image.network(
                            avatarUrl,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 24,
                        ),
                ),
              const SizedBox(width: 10),
              // 消息内容
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF333333),
                          ),
                        ),
                        if (badge != null) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFF007DF9),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Text(
                              badge,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      content,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF989898),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // 时间和未读数
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF989898),
                    ),
                  ),
                  if (unreadCount != null && unreadCount > 0) ...[
                    const SizedBox(height: 4),
                    Container(
                      width: 17,
                      height: 17,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEA5F5A),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          unreadCount > 99 ? '99+' : '$unreadCount',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFDFCFE),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
        // 分隔线
        Container(
          height: 1,
          margin: const EdgeInsets.only(left: 73),
          color: const Color(0xFFF5F5F5),
        ),
      ],
    );
  }

  // 消息列表
  Widget _buildMessageList() {
    return Expanded(
      child: ListView(
        children: [
          // 运单状态提醒
          _buildMessageItem(
            title: '运单状态提醒',
            content: '订单预计【9月20日 下午14:00装货】请...',
            time: '2小时前',
            unreadCount: 6,
            isSystem: true,
          ),
          // 系统提醒
          _buildMessageItem(
            title: '系统提醒',
            content: '八月新政策来袭！',
            time: '8小时前',
            unreadCount: null,
            isSystem: true,
          ),
          // 元老板
          _buildMessageItem(
            title: '元老板',
            content: '好的，到了提前联系。',
            time: '昨日12:30',
            unreadCount: null,
            isSystem: false,
            badge: '货主',
          ),
          // 桉木选
          _buildMessageItem(
            title: '桉木选',
            content: '放到位置了，你们那边签收下！',
            time: '2024.03.22',
            unreadCount: 1,
            isSystem: false,
            badge: '收货商',
          ),
          // 徐亚
          _buildMessageItem(
            title: '徐亚',
            content: '[图片]',
            time: '2024.03.22',
            unreadCount: null,
            isSystem: false,
            badge: '货主',
          ),
        ],
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return Stack(
      children: [
        // 背景图片
        _buildTopBackground(),
        // 内容区域
        Column(
          children: [
            // 添加状态栏高度的间距
            SizedBox(height: MediaQuery.of(Get.context!).padding.top),
            // 固定顶部标题栏
            _buildHeader(),
            const SizedBox(height: 8),
            _buildActionButtons(),
            const SizedBox(height: 24),
            _buildMessageList(),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MsgController>(
      init: MsgController(),
      id: "msg",
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
