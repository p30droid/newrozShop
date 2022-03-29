

import 'package:get/get.dart';
import 'package:newroz_shop/pages/setting/setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(SettingController()) ;
  }



}