import 'package:day08_user_settings/model.dart';
import 'package:day08_user_settings/preferences_services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _prefService = PreferencesServices();

  final _userController = TextEditingController();
  var _selectedGender = Gender.MALE;
  var _selectedLanguages = <ProgrammingLanguages>{};
  var _isEmployed = false;

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  void _populateFields() async {
    final settings = await _prefService.getSettings();

    setState(() {
      _userController.text = settings.username;
      _selectedGender = settings.gender;
      _selectedLanguages = settings.programmingLanguages;
      _isEmployed = settings.isEmployed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("User Settings"),
        ),
        body: ListView(
          children: [
            ListTile(
              title: TextField(
                controller: _userController,
                decoration: const InputDecoration(
                  labelText: "username",
                ),
              ),
            ),
            RadioListTile(
              title: const Text("Male"),
              value: Gender.MALE,
              groupValue: _selectedGender,
              onChanged: (value) => setState(() {
                _selectedGender = value!;
              }),
            ),
            RadioListTile(
              title: const Text("Female"),
              value: Gender.FEMALE,
              groupValue: _selectedGender,
              onChanged: (value) => setState(() {
                _selectedGender = value!;
              }),
            ),
            CheckboxListTile(
              title: const Text("Dart"),
              value: _selectedLanguages.contains(ProgrammingLanguages.DART),
              onChanged: (value) {
                setState(() {
                  _selectedLanguages.contains(ProgrammingLanguages.DART)
                      ? _selectedLanguages.remove(ProgrammingLanguages.DART)
                      : _selectedLanguages.add(ProgrammingLanguages.DART);
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Kotlin"),
              value: _selectedLanguages.contains(ProgrammingLanguages.KOTLIN),
              onChanged: (value) {
                setState(() {
                  _selectedLanguages.contains(ProgrammingLanguages.KOTLIN)
                      ? _selectedLanguages.remove(ProgrammingLanguages.KOTLIN)
                      : _selectedLanguages.add(ProgrammingLanguages.KOTLIN);
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Swift"),
              value: _selectedLanguages.contains(ProgrammingLanguages.SWIFT),
              onChanged: (value) {
                setState(() {
                  _selectedLanguages.contains(ProgrammingLanguages.SWIFT)
                      ? _selectedLanguages.remove(ProgrammingLanguages.SWIFT)
                      : _selectedLanguages.add(ProgrammingLanguages.SWIFT);
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Java"),
              value: _selectedLanguages.contains(ProgrammingLanguages.JAVA),
              onChanged: (value) {
                setState(() {
                  _selectedLanguages.contains(ProgrammingLanguages.JAVA)
                      ? _selectedLanguages.remove(ProgrammingLanguages.JAVA)
                      : _selectedLanguages.add(ProgrammingLanguages.JAVA);
                });
              },
            ),
            SwitchListTile(
              title: const Text("Employed"),
              value: _isEmployed,
              onChanged: (value) => setState(() {
                _isEmployed = value;
              }),
            ),
            TextButton(
              onPressed: _saveSettings,
              child: const Text("Save Settings"),
            ),
          ],
        ),
      ),
    );
  }

  void _saveSettings() {
    final newSettings = Settings(
      username: _userController.text,
      gender: _selectedGender,
      programmingLanguages: _selectedLanguages,
      isEmployed: _isEmployed,
    );

    print(newSettings);
    _prefService.saveSettings(newSettings);
  }
}
