enum LangaugeType { ENGLISG, ARABIC }

const String ARABIC = "ar";
const String ENGLISG = "en";

extension languageTypeExtension on LangaugeType {
  String getValue() {
    switch (this) {
      case LangaugeType.ENGLISG:
        return ENGLISG;
      case LangaugeType.ARABIC:
        return ARABIC;
    }
  }
}
