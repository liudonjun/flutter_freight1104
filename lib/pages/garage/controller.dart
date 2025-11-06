import 'package:get/get.dart';

class GarageController extends GetxController {
  GarageController();

  // 车辆列表
  var vehicleList = <VehicleItem>[
    VehicleItem(
      id: '1',
      brand: '中国一汽',
      model: 'J7经典版',
      type: '8×4载货',
      plateProvince: '渝',
      plateNumber: 'A7T673',
      length: '6.8米',
      style: '厢式车',
      loadCapacity: '20吨',
      isDefault: true,
      vin: 'LFNASDFJ2345DFGTH',
      engineNumber: 'AB12345678',
      registrationDate: '2020-05-15',
    ),
    VehicleItem(
      id: '2',
      brand: '东风汽车',
      model: '天龙旗舰',
      type: '6×4牵引',
      plateProvince: '川',
      plateNumber: 'B88888',
      length: '9.6米',
      style: '半挂车',
      loadCapacity: '30吨',
      isDefault: false,
      vin: 'LDNBSDFJ2345DFGTH',
      engineNumber: 'CD87654321',
      registrationDate: '2021-08-20',
    ),
  ].obs;

  // 当前选中的车辆索引
  var selectedVehicleIndex = 0.obs;

  // 切换选中车辆
  void selectVehicle(int index) {
    selectedVehicleIndex.value = index;
  }

  // 设为默认车辆
  void setDefaultVehicle(int index) {
    for (var i = 0; i < vehicleList.length; i++) {
      vehicleList[i].isDefault = (i == index);
    }
    vehicleList.refresh();
    Get.snackbar('提示', '已设为默认车辆');
  }

  // 添加车辆
  void addVehicle() {
    Get.snackbar('提示', '添加车辆功能');
  }

  // 编辑车辆
  void editVehicle(VehicleItem vehicle) {
    Get.snackbar('编辑车辆', '车牌: ${vehicle.plateProvince}${vehicle.plateNumber}');
  }

  // 删除车辆
  void deleteVehicle(VehicleItem vehicle) {
    Get.snackbar('删除车辆', '车牌: ${vehicle.plateProvince}${vehicle.plateNumber}');
  }

  // 查看证件
  void viewDocuments(VehicleItem vehicle) {
    Get.snackbar('查看证件', '车牌: ${vehicle.plateProvince}${vehicle.plateNumber}');
  }

  _initData() {
    update(["garage"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}

// 车辆信息模型
class VehicleItem {
  final String id;
  final String brand;
  final String model;
  final String type;
  final String plateProvince;
  final String plateNumber;
  final String length;
  final String style;
  final String loadCapacity;
  bool isDefault;
  final String vin;
  final String engineNumber;
  final String registrationDate;

  VehicleItem({
    required this.id,
    required this.brand,
    required this.model,
    required this.type,
    required this.plateProvince,
    required this.plateNumber,
    required this.length,
    required this.style,
    required this.loadCapacity,
    required this.isDefault,
    required this.vin,
    required this.engineNumber,
    required this.registrationDate,
  });
}
