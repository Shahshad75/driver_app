import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taxi_app/controller/driver_controller.dart';
import 'package:taxi_app/controller/driver_info.dart';
import 'package:taxi_app/service/shadepreferance.dart';

import '../service/api.dart';
import '../widgets/bottam_navigaton_bar.dart';

class SignInController extends GetxController {
  GlobalKey<FormState> signinsformKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  DriverController controller = Get.put(DriverController());
  loginDriver() async {
    if (signinsformKey.currentState!.validate()) {
      DriverModel? driverInfo = await checkUser();
      if (driverInfo != null) {
        controller.driver = driverInfo;
        Sharedpref.instence.setAuthDetaials(driverInfo);
        Get.offAll(const BottamNavBar());
      } else {
        Get.snackbar("Error Occured", 'Enter valid password and Email');
      }
    }
  }

  checkUser() async {
    DriverModel driverInfo = await Apicalling.loginDriver(
        usernameController.text.trim(), passwordController.text.trim());
    return driverInfo;
  }

  textFeildValidation(String value) {
    if (value.isEmpty) {
      return "Fill the fireld";
    } else {
      return null;
    }
  }
}
