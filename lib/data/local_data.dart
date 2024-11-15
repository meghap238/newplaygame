
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static String valueSharedPreferences = 'deviceId';

// Write DATA
  static Future saveUserData(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(valueSharedPreferences, value);
  }

 static getMobile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int? intValue = prefs.getInt('mobile');
    return intValue;
  }

  static Future saveUserId(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString('userId', value);
  }


}