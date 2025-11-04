import 'package:flutter/material.dart';
import 'package:flutter_freight/common/index.dart';
import 'package:flutter_freight/pages/index.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  // Build the page based on selected tab
  Widget _buildPageContent(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const WaybillPage();
      case 2:
        return const MsgPage();
      case 3:
        return const MinePage();
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      id: "main",
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            top: false,
            child: _buildPageContent(controller.selectedTabIndex.value),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedTabIndex.value,
            onTap: controller.onTabTapped,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: HexColor('#007DF9'),
            unselectedItemColor: HexColor('#666666'),
            backgroundColor: Colors.white,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/home.png',
                    width: 24, height: 24),
                activeIcon: Image.asset('assets/images/home_selected.png',
                    width: 24, height: 24),
                label: '首页',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/shipment.png',
                    width: 24, height: 24),
                activeIcon: Image.asset('assets/images/shipment_selected.png',
                    width: 24, height: 24),
                label: '运单',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/message.png',
                    width: 24, height: 24),
                activeIcon: Image.asset('assets/images/message_selected.png',
                    width: 24, height: 24),
                label: '消息',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/profile.png',
                    width: 24, height: 24),
                activeIcon: Image.asset('assets/images/profile_selected.png',
                    width: 24, height: 24),
                label: '我的',
              ),
            ],
          ),
        );
      },
    );
  }
}
