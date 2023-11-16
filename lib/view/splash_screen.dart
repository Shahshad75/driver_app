import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/controller/driver_controller.dart';
import 'package:taxi_app/service/api.dart';
import 'package:taxi_app/service/shadepreferance.dart';
import 'package:taxi_app/controller/sign_in_controller.dart';
import 'package:taxi_app/view/login_screen.dart';
import 'package:taxi_app/view/welcome_screen.dart';

import '../widgets/bottam_navigaton_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SignInController controller = Get.put(SignInController());

  final DriverController driver = Get.put(DriverController());
  @override
  void initState() {
    super.initState();
    validatorDriver();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        width: 100,
        height: 100,
      ),
    );
  }

  void validatorDriver() async {
    final driverAuth = Sharedpref.instence.getAuthDetails();

    if (driverAuth != null) {
      final data = await Apicalling.loginDriver(
          driverAuth['username'], driverAuth['password']);

      if (data != null) {
        driver.driver = data;
        Get.offAll(const BottamNavBar());
      } else {
        Get.offAll(SignInScreen());
      }
    } else {
      await Future.delayed(const Duration(seconds: 2));
      Get.off(WelcomeScreen());
    }
  }
}
