import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_app/controller/driver_info.dart';
import 'package:taxi_app/model/document_model.dart';
import 'package:taxi_app/model/driver_model.dart';
import 'package:taxi_app/service/url.dart';

import '../model/vehicle_model.dart';

class Apicalling {
  static Future<int?> driverPost(Driver driver) async {
    var url = '${Url.baseUrlPhone}/create';
    final uri = Uri.parse(url);
    final body = driver.toJson();
    var response =
        await http.post(uri, body: jsonEncode(body), headers: Url.headers);
    if (response.statusCode == 200) {
      int id = jsonDecode(response.body);
      return id;
    } else {}
    return null;
  }

  static Future<bool> addVehicle(VehicleDetails vehicle) async {
    var url = '${Url.baseUrlPhone}/vehicledetails';
    final uri = Uri.parse(url);
    final body = vehicle.toJson();
    var response =
        await http.post(uri, body: jsonEncode(body), headers: Url.headers);
    return response.statusCode == 200;
  }

  static Future<bool> addDocumets(Documents document) async {
    var url = '${Url.baseUrlPhone}/documents';
    final uri = Uri.parse(url);
    final body = document.toJson();
    var response =
        await http.post(uri, body: jsonEncode(body), headers: Url.headers);
    return response.statusCode == 200;
  }

  static Future loginDriver(String username, String password) async {
    var url = Url.baseUrlPhone + Url.login;
    final uri = Uri.parse(url);
    final body = {'username': username, 'password': password};

    var response =
        await http.post(uri, body: jsonEncode(body), headers: Url.headers);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      DriverModel driverInfo = DriverModel.fromJson(responseData['driver']);
      return driverInfo;
    } else {
      return null;
    }
  }

  static Future<bool> updateLocationCoordinates(Position position,int id) async {
    var url = '${Url.baseUrlPhone}${Url.updateLocation}$id';
    var uri = Uri.parse(url);
    final body = {
      "latitude": position.latitude,
      " longitude": position.longitude
    };
    var response =
        await http.patch(uri, body: jsonEncode(body), headers: Url.headers);
    return response.statusCode == 200;
  }
}
