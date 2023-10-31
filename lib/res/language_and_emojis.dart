class Language {
  const Language({
    required this.name,
    required this.flag,
    required this.languageCode,
    required this.id,
  });
  final String name, flag, languageCode;
  final int id;

  static List<Language> languageList() => <Language>[
        Language(
            name: 'English-us', flag: Emojis.usFlag, languageCode: 'en', id: 1),
        Language(
            name: 'Spain', flag: Emojis.spainFlag, languageCode: 'es', id: 1),
      ];

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
        name: json['name'],
        flag: json['flag'],
        languageCode: json['languageCode'],
        id: json['id']);
  }

  toMap() {
    return {'id': id, 'name': name, 'flag': flag, 'languageCode': languageCode};
  }
}

class Emojis {
  static String get usFlag => '🇺🇸';
  static String get spainFlag => '🇪🇸';
}
