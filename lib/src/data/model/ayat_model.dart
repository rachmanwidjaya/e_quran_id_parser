import 'package:e_quran_id/src/domain/entity/ayat.dart';

class AyatModel extends Ayat {
  ///```dart
  ///AyatModel.fromJson(
  ///   nomorAyat: json['nomorAyat'],
  ///   teksArab: json['teksArab'],
  ///   teksLatin: json['teksLatin'],
  ///   teksIndonesia: json['teksIndonesia'],
  ///   audios: json['audio'],
  ///);
  ///```
  AyatModel.fromJson(Map<String, dynamic> json)
      : super(
          nomorAyat: json['nomorAyat'],
          teksArab: json['teksArab'],
          teksLatin: json['teksLatin'],
          teksIndonesia: json['teksIndonesia'],
          audios: List<String>.from(json['audio'].values),
        );
  static List<AyatModel> parseFromJsom(dynamic jsonMap) =>
      List<AyatModel>.from(jsonMap.map((x) => AyatModel.fromJson(x)));
}
