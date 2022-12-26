import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    
  }

  /*static Future<bool> putListOfUrl({
    required String key,
    required List<String> value,
  }) async {
    return await sharedPreferences!.setStringList(key, value);
  }

  static List<String>? getListOfUrl({
    required String key,
  }) {
    return sharedPreferences!.getStringList(key);
  }*/

  static Future<bool> putIsDarkValue(String key,bool isDark)async{
      return  await sharedPreferences!.setBool(key, isDark);
   } 

   static bool? getIsDarkValue(String key) {
      return sharedPreferences!.getBool(key);
   }


    static Future<bool> putIsLangaugeValue(String key,bool language)async
       {
       return  await sharedPreferences!.setBool(key, language);
       } 

   static bool? getLangaugeValue(String key) {
      return sharedPreferences!.getBool(key);
   }

    

}

