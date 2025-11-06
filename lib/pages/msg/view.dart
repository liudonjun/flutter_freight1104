import 'package:flutter/material.dart';
import 'package:flutter_freight/pages/custom_service/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class MsgPage extends GetView<MsgController> {
  const MsgPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("MsgPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MsgController>(
      init: MsgController(),
      id: "msg",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("msg"),
            actions: [
              // 消息按钮
              IconButton(
                onPressed: () {
                  Get.to(
                    CustomServicePage(),
                  );
                },
                icon: const Icon(Icons.notifications_none),
              ),
            ],
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
