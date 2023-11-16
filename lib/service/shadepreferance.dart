import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_app/controller/driver_info.dart';

class Sharedpref {
  Sharedpref._();
  static final Sharedpref _instence = Sharedpref._();
  static Sharedpref get instence => _instence;

  static const String username = 'username';
  static const String password = 'password';

  late SharedPreferences sharedpref;

  initeStorage() async {
    sharedpref = await SharedPreferences.getInstance();
  }

  setAuthDetaials(DriverModel driverInfo) async {
    await sharedpref.setString(username, driverInfo.username);
    await sharedpref.setString(password, driverInfo.password);
  }

  signout() {
    sharedpref.remove(username);
    sharedpref.remove(password);
  }

  Map<String, dynamic>? getAuthDetails() {
    String? usernames = sharedpref.getString(username);
    String? passwords = sharedpref.getString(password);
    if (usernames == null || passwords == null) return null;
    Map<String, dynamic> authDetails = {
      'username': usernames,
      'password': passwords,
    };
    return authDetails;
  }
}
