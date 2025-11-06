import 'package:get/get.dart';

class RoadsideAssistanceController extends GetxController {
  RoadsideAssistanceController();

  // 选中的服务类型索引
  final RxInt selectedServiceIndex = 0.obs;

  // 服务类型列表
  final List<String> serviceTypes = ['拖车', '换胎', '脱困', '搭电', '其它'];

  // 表单字段
  final RxString rescueLocation = ''.obs;
  final RxString licensePlate = ''.obs;
  final RxString vehicleType = ''.obs;
  final RxString contactPhone = ''.obs;
  final RxString vehicleBrand = ''.obs;
  final RxString province = '粤'.obs;
  final RxBool isNewEnergy = false.obs;

  // 预估价格
  final RxString estimatedPrice = '699'.obs;

  _initData() {
    update(["roadside_assistance"]);
  }

  // 选择服务类型
  void selectServiceType(int index) {
    selectedServiceIndex.value = index;
    update(["roadside_assistance"]);
  }

  // 选择省份
  void selectProvince() {
    // TODO: 打开省份选择弹窗
  }

  // 选择救援位置
  void selectLocation() {
    // TODO: 打开地图选择位置
  }

  // 选择车辆类型
  void selectVehicleType() {
    // TODO: 打开车辆类型选择弹窗
  }

  // 切换新能源车牌
  void toggleNewEnergy() {
    isNewEnergy.value = !isNewEnergy.value;
    update(["roadside_assistance"]);
  }

  // 查看收费说明
  void viewPriceDescription() {
    // TODO: 打开收费说明弹窗
  }

  // 立即呼叫
  void callNow() {
    // TODO: 验证表单并提交
    if (rescueLocation.value.isEmpty) {
      Get.snackbar('提示', '请选择救援位置');
      return;
    }
    if (licensePlate.value.isEmpty) {
      Get.snackbar('提示', '请输入车牌号码');
      return;
    }
    if (vehicleType.value.isEmpty) {
      Get.snackbar('提示', '请选择车辆类型');
      return;
    }
    if (contactPhone.value.isEmpty) {
      Get.snackbar('提示', '请输入联系电话');
      return;
    }
    if (vehicleBrand.value.isEmpty) {
      Get.snackbar('提示', '请输入车辆品牌');
      return;
    }

    // 提交请求
    Get.snackbar('成功', '救援请求已提交');
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
