import 'package:shared_preferences/shared_preferences.dart';

class LocalRepo {
  final SharedPreferences _sharedPref;

  LocalRepo._internal({required SharedPreferences sharedPreferences})
      : _sharedPref = sharedPreferences;


  static Future<LocalRepo > init() async{ 
    return LocalRepo._internal(sharedPreferences: await SharedPreferences.getInstance());
  }

  static const ID_TOKEN = "idToken";


  String? get idToken {
    return _sharedPref.getString(ID_TOKEN);
  }

  set idToken(String? token){
    if(token!=null) _sharedPref.setString(ID_TOKEN,token);
  }
}
