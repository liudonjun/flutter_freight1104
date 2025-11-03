import 'package:flutter_freight/common/index.dart';
import 'package:flutter_freight/pages/index.dart';
import 'package:get/get.dart';

class RoutePages {
  // 列表
  static List<GetPage> list = [
    GetPage(name: RouteNames.main, page: () => const MainPage()),
  ];
}
