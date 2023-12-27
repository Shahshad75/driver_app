import 'package:get/get.dart';
import 'package:taxi_app/model/driver_model.dart';
import 'package:taxi_app/model/revenue.dart';
import 'package:taxi_app/service/repo.dart';

class DriverController extends GetxController {
  late Driver driver;
  List<Revenue> revenue = [];
  getRevenue() async {
    revenue =
        await Repo.getRevenueByDate("12/12/2023", "21/26/2023", driver.id!);
  }
}
