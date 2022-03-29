import 'dart:io';

class Util {
  static String get jsonFile {
    String languageCode = Platform.localeName.split('_')[0];

    switch (languageCode) {
      case "en":
        return "assets/json/kamasutra_en.json";
      case "it":
        return "assets/json/kamasutra_it.json";
      default:
        return "assets/json/kamasutra_en.json";
    }
  }
}
