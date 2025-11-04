import 'package:get/get.dart';

class MainController extends GetxController {
  // Current selected tab index
  final RxInt selectedTabIndex = 0.obs;

  // Tab titles
  final List<String> tabTitles = ['首页', '运单', '消息', '我的'];

  // Tab icons paths
  final List<String> tabIcons = [
    'assets/images/home.png',
    'assets/images/shipment.png',
    'assets/images/message.png',
    'assets/images/profile.png',
  ];

  // Tab icons paths (selected)
  final List<String> tabIconsSelected = [
    'assets/images/home_selected.png',
    'assets/images/shipment_selected.png',
    'assets/images/message_selected.png',
    'assets/images/profile_selected.png',
  ];

  MainController();

  _initData() {
    update(["main"]);
  }

  void onTabTapped(int index) {
    selectedTabIndex.value = index;
    update(["main"]);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
