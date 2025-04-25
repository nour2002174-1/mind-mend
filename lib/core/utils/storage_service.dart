import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
  }

  static Future<void> saveId(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('id', id);
  }

  static Future<int?> getId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('id');
  }

  static Future<void> removeId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('id');
  }
}