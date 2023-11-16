import 'package:get/get.dart';

class IndroController extends GetxController {
  RxBool status = false.obs;
  statusChecking() {
    status.value = true;
  }
}
