import 'package:flutter/cupertino.dart';
import 'package:recete/prefrences/service/preferences_service.dart';

import '../model/prefences.dart';

class PreferencessProvider extends ChangeNotifier {
  late final MyPrefrencesService _prefrencesService;

  Prefrences _prefrences = Prefrences.defaultValues();

  Prefrences get prefrences => _prefrences;

  Future<Prefrences> getPrefences() async {
    _prefrences = await _prefrencesService.getPrefences();
    return _prefrences;
  }

  changePrefrences(Prefrences prefrences) {
    _prefrences = prefrences;
    notifyListeners();
  }
}
