import 'package:flutter_freight/common/index.dart';
import 'package:flutter_freight/pages/cargo_detail/index.dart';
import 'package:flutter_freight/pages/index.dart';
import 'package:get/get.dart';

class RoutePages {
  // 列表
  static List<GetPage> list = [
    GetPage(name: RouteNames.main, page: () => const MainPage()),
    GetPage(name: RouteNames.home, page: () => const HomePage()),
    GetPage(name: RouteNames.waybill, page: () => const WaybillPage()),
    GetPage(name: RouteNames.msg, page: () => const MsgPage()),
    GetPage(name: RouteNames.mine, page: () => const MinePage()),
    GetPage(
        name: RouteNames.roadsideAssistance,
        page: () => const RoadsideAssistancePage()),
    GetPage(name: RouteNames.cargoDetail, page: () => const CargoDetailPage()),
    GetPage(
        name: RouteNames.driverVerify, page: () => const DriverVerifyPage()),
    GetPage(
        name: RouteNames.idCardVerify, page: () => const IdCardVerifyPage()),
    GetPage(name: RouteNames.profile, page: () => const ProfilePage()),
    GetPage(name: RouteNames.grabb, page: () => const GrabbPage()),
  ];
}
