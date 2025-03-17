import 'package:flutter/foundation.dart';

import '../data/shared_pref_service.dart';

class SharedPrefProvider extends ChangeNotifier {
  final SharedPrefService _sharedPrefService = SharedPrefService();

  Future<bool> setBoolValue(String key, bool value) async {
    bool result = await _sharedPrefService.setBoolValue(key, value);
    notifyListeners();
    return result;
  }

  bool getBoolValue(String key) {
    return _sharedPrefService.getBoolValue(key);
  }
}
