import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {

  static const String selectedVideoId = 'SELECTED_VIDEO_ID';
  static const String selectedNewsId = 'SELECTED_NEWS_ID';
  static const String isLangEnglish = 'IS_LANG_ENGLISH';

  static late SharedPreferences _sharedPreferences;

  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    print('Shared Preferences INITIALIZED');
  }

  static Future setSelectedVideoId(String videoId) async {
    _sharedPreferences.setString(selectedVideoId, videoId);
  }

  static String? getSelectedVideoId() {
    return _sharedPreferences.getString(selectedVideoId);
  }

  static Future setSelectedNewsId(String videoId) async {
    _sharedPreferences.setString(selectedNewsId, videoId);
  }

  static String? getSelectedNewsId() {
    return _sharedPreferences.getString(selectedNewsId);
  }

}