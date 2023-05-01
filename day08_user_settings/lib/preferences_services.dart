import 'package:day08_user_settings/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesServices {
  Future saveSettings(Settings settings) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("username", settings.username);
    await prefs.setBool("isEmployed", settings.isEmployed);
    await prefs.setInt("gender", settings.gender.index);
    await prefs.setStringList(
      "programmingLanguages",
      settings.programmingLanguages
          .map((lang) => lang.index.toString())
          .toList(),
    );

    print("Saved Settings");
  }

  Future<Settings> getSettings() async {
    final preferences = await SharedPreferences.getInstance();

    final username = preferences.getString('username');
    final isEmployed = preferences.getBool('isEmployed');
    final gender = Gender.values[preferences.getInt('gender') ?? 0];

    final programmingLanguagesIndicies =
        preferences.getStringList('programmingLanguages');

    final programmingLanguages = programmingLanguagesIndicies
        ?.map((stringIndex) =>
            ProgrammingLanguages.values[int.parse(stringIndex)])
        .toSet();

    return Settings(
        username: username ?? "",
        gender: gender,
        programmingLanguages: programmingLanguages!,
        isEmployed: isEmployed ?? false);
  }
}
