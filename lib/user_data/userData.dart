import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  double? userRating;
  int? compSessions;
  int? totalHS;
  double? avWH;
  int? todayCS;
  double? todayR;
  String? userName;
  List<double> dailyWH = [];
  List<double> dailyCS = [];
  List<String> titles = ["Beginner", "Amateur", "Professional", "Legend"];

  UserData() {
    if (todayCS != null) {
      todayR = todayCS! / 16;
    }
  }

  Future<void> saveToPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('userRating', userRating ?? 0);
    await prefs.setInt('compSessions', compSessions ?? 0);
    await prefs.setInt('totalHS', totalHS ?? 0);
    await prefs.setDouble('avWH', avWH ?? 0);
    await prefs.setInt('todayCS', todayCS ?? 0);
    await prefs.setDouble('todayR', todayR ?? 0);
    await prefs.setString('userName', userName ?? '');
    await prefs.setStringList('dailyWH', dailyWH.map((e) => e.toString()).toList());
    await prefs.setStringList('dailyCS', dailyCS.map((e) => e.toString()).toList());
  }

  Future<void> loadFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userRating = prefs.getDouble('userRating');
    compSessions = prefs.getInt('compSessions');
    totalHS = prefs.getInt('totalHS');
    avWH = prefs.getDouble('avWH');
    todayCS = prefs.getInt('todayCS');
    todayR = prefs.getDouble('todayR');
    userName = prefs.getString('userName');
    List<String>? dailyWHStrings = prefs.getStringList('dailyWH');
    List<String>? dailyCSStrings = prefs.getStringList('dailyCS');
    if (dailyWHStrings != null) {
      dailyWH = dailyWHStrings.map((e) => double.parse(e)).toList();
    }
    if (dailyCSStrings != null) {
      dailyCS = dailyCSStrings.map((e) => double.parse(e)).toList();
    }
  }
}