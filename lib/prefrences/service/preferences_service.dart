import 'dart:convert';

import 'package:recete/prefrences/model/prefences.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferncesService {
  Prefrences getPrefences();
  Future<void> setPrefences(Prefrences prefences);
}

class MyPrefrencesService implements PreferncesService {
  static const PREFS_KEY = 'prefs';

  final SharedPreferences _sharedPreferences;

  MyPrefrencesService(this._sharedPreferences);

  @override
  Prefrences getPrefences() {
    final data = _sharedPreferences.getString(PREFS_KEY);
    if (data == null) {
      return Prefrences.defaultValues();
    } else {
      return Prefrences.fromJson(jsonDecode(data));
    }
  }

  @override
  Future<void> setPrefences(Prefrences prefences) async {
    final data = prefences.toJson();
    await _sharedPreferences.setString(PREFS_KEY, jsonEncode(data));
  }
}
