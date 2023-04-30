import 'dart:convert';

///```dart
///Ayat({
///    int nomorAyat = 0,
///    String teksArab = '',
///    String teksLatin = '',
///    String teksIndonesia = '',
///    List<String> audios = const [],
///});
///```
class Ayat {
  Ayat({
    this.nomorAyat = 0,
    this.teksArab = '',
    this.teksLatin = '',
    this.teksIndonesia = '',
    this.audios = const [],
  });

  final int nomorAyat;
  final String teksArab;
  final String teksLatin;
  final String teksIndonesia;
  final List<String> audios;

  Ayat copyWith({
    int? nomorAyat,
    String? teksArab,
    String? teksLatin,
    String? teksIndonesia,
    List<String>? audios,
  }) =>
      Ayat(
        nomorAyat: nomorAyat ?? this.nomorAyat,
        teksArab: teksArab ?? this.teksArab,
        teksLatin: teksLatin ?? this.teksLatin,
        teksIndonesia: teksIndonesia ?? this.teksIndonesia,
        audios: audios ?? this.audios,
      );

  ///this method will return:
  ///```dart
  ///{
  ///   "nomorAyat": nomorAyat,
  ///   "teksArab": teksArab,
  ///   "teksLatin": teksLatin,
  ///   "teksIndonesia": teksIndonesia,
  ///   "audios": audios,
  ///}
  /// ```
  Map<String, dynamic> toMap() => {
        "nomorAyat": nomorAyat,
        "teksArab": teksArab,
        "teksLatin": teksLatin,
        "teksIndonesia": teksIndonesia,
        "audios": audios,
      };
  @override
  String toString() => jsonEncode(toMap());
}

extension ListAyatEntityExtension on List<Ayat> {
  ///this method will return:
  ///```dart
  ///[{
  ///   "nomorAyat": nomorAyat,
  ///   "teksArab": teksArab,
  ///   "teksLatin": teksLatin,
  ///   "teksIndonesia": teksIndonesia,
  ///   "audios": audios,
  ///}]
  /// ```
  List<Map<String, dynamic>> toMap() =>
      List<Map<String, dynamic>>.from(map((e) => e.toMap()));
}
