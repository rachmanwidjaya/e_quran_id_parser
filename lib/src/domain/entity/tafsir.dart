import 'dart:convert';

///```dart
///Tafsir({
///    int ayat = 0,
///    String text = '',
///});
///```

class Tafsir {
  final int ayat;
  final String text;
  Tafsir({
    this.ayat = 0,
    this.text = '',
  });

  Tafsir copyWith({
    int? ayat,
    String? text,
  }) =>
      Tafsir(
        ayat: ayat ?? this.ayat,
        text: this.text,
      );

  ///this method will return:
  ///```dart
  ///{
  ///   "ayat": ayat,
  ///   "text": text,
  ///}
  /// ```
  Map<String, dynamic> toMap() => {
        "ayat": ayat,
        "text": text,
      };
  @override
  String toString() => jsonEncode(toMap());
}

extension ListTafsirEntityyExtension on List<Tafsir> {
  ///this method will return:
  ///```dart
  ///[
  ///   {
  ///       "ayat": ayat,
  ///       "text": text,
  ///   }
  /// ]
  /// ```
  List<Map<String, dynamic>> toMap() =>
      List<Map<String, dynamic>>.from(map((e) => e.toMap()));
}
