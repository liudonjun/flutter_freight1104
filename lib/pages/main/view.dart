import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/custom_bottom_nav_bar.dart';
import 'widgets/pickup_page.dart';
import 'widgets/station_page.dart';
import 'widgets/send_page.dart';
import 'widgets/search_page.dart';
import 'widgets/me_page.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  // Build the page based on selected tab
  Widget _buildPageContent(int index) {
    switch (index) {
      case 0:
        return const PickupPage();
      case 1:
        return const StationPage();
      case 2:
        return const SendPage();
      case 3:
        return const SearchPage();
      case 4:
        return const MePage();
      default:
        return const PickupPage();
    }
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
          bottomNavigationBar: CustomBottomNavBar(
            selectedIndex: controller.selectedTabIndex.value,
            onTap: controller.onTabTapped,
            labels: controller.tabTitles,
            icons: controller.tabIcons,
          ),
        );
      },
    );
  }
}
