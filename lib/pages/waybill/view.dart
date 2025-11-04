import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class WaybillPage extends GetView<WaybillController> {
  const WaybillPage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("WaybillPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WaybillController>(
      init: WaybillController(),
      id: "waybill",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("waybill")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
