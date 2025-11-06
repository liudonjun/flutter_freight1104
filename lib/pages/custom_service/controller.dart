import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomServiceController extends GetxController {
  CustomServiceController();

  // 文本输入控制器
  final TextEditingController textController = TextEditingController();

  // 常见问题列表
  final List<String> commonQuestions = [
    '我的订单超时了如何处理',
    '联系不上寄件/配送方怎么办',
    '运单转接他人如何操作',
    '运单如何开发票',
  ];

  // 快捷功能列表
  final List<Map<String, dynamic>> quickActions = [
    {'icon': Icons.support_agent, 'label': '人工客服', 'color': Color(0xFF007DF9)},
    {
      'icon': Icons.broken_image_outlined,
      'label': '货物损坏',
      'color': Color(0xFFFF7124)
    },
  ];

  // 聊天消息列表
  var messages = <ChatMessage>[
    ChatMessage(
      content: '您好，请问呢有什么可以帮助您？',
      isCustomerService: true,
      time: '09-20 19:23',
    ),
  ].obs;

  // 查看问题详情
  void viewQuestion(String question) {
    Get.snackbar('查看问题', question);
  }

  // 点击常见问题
  void onQuestionTap(String question) {
    // 添加用户消息
    messages.add(ChatMessage(
      content: question,
      isCustomerService: false,
      time: _getCurrentTime(),
    ));

    // 模拟客服回复
    Future.delayed(const Duration(milliseconds: 500), () {
      messages.add(ChatMessage(
        content: '收到您的问题，客服正在为您解答...',
        isCustomerService: true,
        time: _getCurrentTime(),
      ));
    });
  }

  // 点击快捷功能
  void onQuickActionTap(String label) {
    Get.snackbar('快捷功能', label);
  }

  // 发送消息
  void sendMessage() {
    if (textController.text.trim().isEmpty) return;

    messages.add(ChatMessage(
      content: textController.text,
      isCustomerService: false,
      time: _getCurrentTime(),
    ));

    textController.clear();

    // 模拟客服回复
    Future.delayed(const Duration(milliseconds: 500), () {
      messages.add(ChatMessage(
        content: '收到您的消息，客服正在为您处理...',
        isCustomerService: true,
        time: _getCurrentTime(),
      ));
    });
  }

  // 获取当前时间
  String _getCurrentTime() {
    final now = DateTime.now();
    return '${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  }

  _initData() {
    update(["msg"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}

// 聊天消息模型
class ChatMessage {
  final String content;
  final bool isCustomerService;
  final String time;

  ChatMessage({
    required this.content,
    required this.isCustomerService,
    required this.time,
  });
}
