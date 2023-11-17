import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:taxi_app/controller/driver_controller.dart';
import 'package:taxi_app/service/api.dart';

class HomeController extends GetxController {
  DriverController controller = Get.find();
  RxBool value = false.obs;
  Rx<Position> currentLocation = Position(
          longitude: 0,
          latitude: 0,
          timestamp: DateTime.now(),
          accuracy: 0.0,
          altitude: 0.0,
          altitudeAccuracy: 0.0,
          heading: 0.0,
          headingAccuracy: 0.0,
          speed: 0.0,
          speedAccuracy: 0.0)
      .obs;
  late bool servicePermission;
  late LocationPermission permission;
  late StreamSubscription<Position> _locationSubscription;
  RxString currentAddress = ''.obs;

  @override
  void onInit() {
    super.onInit();
    enableservicePermission();
    Geolocator.getPositionStream();

    servicePermission = false;
    permission = LocationPermission.denied;

    _startLocationUpdates();
  }

  @override
  void onClose() {
    super.onClose();
    _locationSubscription.cancel();
  }

  // Future<void> _getAddressFromCoordinates() async {
  //   try {
  //     List<Placemark> placemarks = await placemarkFromCoordinates(
  //         currentLocation.value.latitude, currentLocation.value.longitude);
  //     Placemark place = placemarks[0];

  //     currentAddress.value =
  //         "${place.name}, ${place.locality}, ${place.street}, ${place.country}, ${place.postalCode}";
  //     print("Address :-${currentAddress.value}");
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> _startLocationUpdates() async {
    _locationSubscription = Geolocator.getPositionStream(
      locationSettings:
          AndroidSettings(distanceFilter: 1, accuracy: LocationAccuracy.best),
    ).listen((Position position) {
      currentLocation.value = position;
      print(
          "Location Changed to Latitude is ${currentLocation.value.latitude} and Longitude is ${currentLocation.value.longitude}");

      // _getAddressFromCoordinates();
    });
    var added = await Apicalling.updateLocationCoordinates(
        currentLocation.value, controller.driver.id);
    print("Added := $added");
  }

  void enableservicePermission() async {
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      print("Permission Disabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    currentLocation.value = await Geolocator.getCurrentPosition();
    // _getAddressFromCoordinates();
  }
}
