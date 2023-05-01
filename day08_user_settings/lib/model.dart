enum Gender { MALE, FEMALE }

enum ProgrammingLanguages { DART, KOTLIN, SWIFT, JAVA }

class Settings {
  final String username;
  final Gender gender;
  final Set<ProgrammingLanguages> programmingLanguages;
  final bool isEmployed;

  Settings({
    required this.username,
    required this.gender,
    required this.programmingLanguages,
    required this.isEmployed,
  });
}
