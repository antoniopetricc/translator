class Translate {
  Translate({
    required this.translatedText,
  });
  late final String translatedText;

  Translate.fromJson(Map<String, dynamic> json) {
    translatedText = json['translatedText'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['translatedText'] = translatedText;
    return _data;
  }
}
