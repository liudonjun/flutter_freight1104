import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  HomeController();

  // 刷新控制器
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  _initData() {
    update(["home"]);
  }

  void onTap() {}

  // 下拉刷新
  void onRefresh() async {
    // 模拟网络请求
    await Future.delayed(const Duration(seconds: 2));

    // 刷新数据逻辑
    // TODO: 加载最新数据

    refreshController.refreshCompleted();
    update(["home"]);
  }

  // 上拉加载
  void onLoading() async {
    // 模拟网络请求
    await Future.delayed(const Duration(seconds: 2));

    // 加载更多数据逻辑
    // TODO: 加载更多数据

    refreshController.loadComplete();
    update(["home"]);
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

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }
}
