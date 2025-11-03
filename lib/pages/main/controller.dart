import 'package:get/get.dart';

class MainController extends GetxController {
  // Current selected tab index
  final RxInt selectedTabIndex = 0.obs;

  // Tab titles
  final List<String> tabTitles = ['取件', '驻站', '寄件', '查件', '我的'];

  // Tab icons paths
  final List<String> tabIcons = [
    'assets/icons/nav/pickup.svg',
    'assets/icons/nav/station.svg',
    'assets/icons/nav/send.svg',
    'assets/icons/nav/search.svg',
    'assets/icons/nav/me.svg',
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
