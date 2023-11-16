import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taxi_app/controller/driver_info.dart';
import 'package:taxi_app/model/document_model.dart';
import 'package:taxi_app/model/driver_model.dart';

import '../model/vehicle_model.dart';

class Apicalling {
  static Future<int?> driverPost(Driver driver) async {
    var url = 'http://10.0.2.2:8080/driver/create';
    final uri = Uri.parse(url);
    final body = driver.toJson();
    var response = await http.post(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      int id = jsonDecode(response.body);
      return id;
    } else {}
    return null;
  }

  static Future<bool> addVehicle(VehicleDetails vehicle) async {
    var url = 'http://10.0.2.2:8080/driver/vehicledetails';
    final uri = Uri.parse(url);
    final body = vehicle.toJson();
    var response = await http.post(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    return response.statusCode == 200;
  }

  static Future<bool> addDocumets(Documents document) async {
    var url = 'http://10.0.2.2:8080/driver/documents';
    final uri = Uri.parse(url);
    final body = document.toJson();
    var response = await http.post(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    return response.statusCode == 200;
  }

  static Future loginDriver(String username, String password) async {
    var url = 'http://10.0.2.2:8080/driver/login';
    final uri = Uri.parse(url);
    final body = {'username': username, 'password': password};

    var response = await http.post(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      DriverModel driverInfo = DriverModel.fromJson(responseData['driver']);
      return driverInfo;
    } else {
      return null;
    }
  }
}
