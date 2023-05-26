import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instancia = new UserPreferences._internal();

  factory UserPreferences() {
    return _instancia;
  }

  UserPreferences._internal();

  SharedPreferences? _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // Getter y Setter para 'levelsDisabled'
  List<String> get levelsDisabled {
    return _prefs!.getStringList('levelsDisabled') ?? [];
  }

  set levelsDisabled(List<String> value) {
    _prefs!.setStringList('levelsDisabled', value);
  }

  // Getter y Setter para 'stars'
  List<String> get stars {
    return _prefs!.getStringList('stars') ?? [];
  }

  set stars(List<String> value) {
    _prefs!.setStringList('stars', value);
  }

  int get totalStars {
    return _prefs!.getInt('totalStars') ?? 0;
  }

  set totalStars(int value) {
    _prefs!.setInt('totalStars', value);
  }

  bool get gameStart {
    return _prefs!.getBool('gameStart') ?? false;
  }

  set gameStart(bool value) {
    _prefs!.setBool('gameStart', value);
  }
}
