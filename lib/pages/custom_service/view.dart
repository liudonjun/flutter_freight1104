import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class CustomServicePage extends GetView<CustomServiceController> {
  const CustomServicePage({super.key});

  // 聊天消息列表
  Widget _buildMessageList() {
    return Obx(() => ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          itemCount: controller.messages.length,
          itemBuilder: (context, index) {
            final message = controller.messages[index];
            return _buildMessageItem(message);
          },
        ));
  }

  // 单个消息气泡
  Widget _buildMessageItem(ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: message.isCustomerService
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          if (message.isCustomerService) ...[
            // 客服头像
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.support_agent, color: Colors.white),
            ),
            const SizedBox(width: 10),
          ],
          // 消息气泡
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: message.isCustomerService
                    ? Colors.white
                    : const Color(0xFF007DF9),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: message.isCustomerService
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                  bottomRight: message.isCustomerService
                      ? const Radius.circular(12)
                      : const Radius.circular(0),
                ),
              ),
              child: Text(
                message.content,
                style: TextStyle(
                  fontSize: 15,
                  color: message.isCustomerService
                      ? const Color(0xFF333333)
                      : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // "猜你想问"区域
  Widget _buildGuessSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFECF5FF),
            Colors.white,
          ],
          stops: [0.0, 0.34],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.lightbulb_outline,
                  size: 16,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                '猜你想问',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...controller.commonQuestions.map((question) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: () => controller.onQuestionTap(question),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        question,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => controller.viewQuestion(question),
                      child: Row(
                        children: [
                          Text(
                            '查看',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 16,
                            color: Colors.grey.shade600,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  // 快捷功能区域
  Widget _buildQuickActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      child: Row(
        children: controller.quickActions.map((action) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: () => controller.onQuickActionTap(action['label']),
              child: Container(
                width: 68,
                height: 69,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: action['label'] == '人工客服'
                              ? [
                                  const Color(0xFF6BB5FF),
                                  const Color(0xFF007DF9),
                                ]
                              : [
                                  const Color(0xFFFFB288),
                                  const Color(0xFFFF7124),
                                ],
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        action['icon'],
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      action['label'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF989898),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // 底部输入栏
  Widget _buildBottomInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
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
        child: Row(
          children: [
            // 语音按钮
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.mic_none,
                size: 20,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(width: 8),
            // 输入框
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F8FA),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: controller.textController,
                  decoration: const InputDecoration(
                    hintText: '请输入您想咨询的问题...',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF989898),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  onSubmitted: (_) => controller.sendMessage(),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // 更多按钮
            InkWell(
              onTap: () {
                // 显示更多功能
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.add_circle_outline,
                  size: 20,
                  color: Color(0xFF333333),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 主视图
  Widget _buildView() {
    return Container(
      color: const Color(0xFFF7F8FA),
      child: Column(
        children: [
          // 时间显示
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: const Text(
              '09-20 19:23',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF989898),
              ),
            ),
          ),
          // 聊天区域
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Obx(() => Column(
                        children: controller.messages
                            .map((msg) => _buildMessageItem(msg))
                            .toList(),
                      )),
                  _buildGuessSection(),
                  _buildQuickActions(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          // 底部输入框
          _buildBottomInput(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomServiceController>(
      init: CustomServiceController(),
      id: "custom_service",
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF333333)),
              onPressed: () => Get.back(),
            ),
            title: const Text(
              '客服助手',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
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
