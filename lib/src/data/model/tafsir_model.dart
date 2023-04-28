import 'package:e_quran_id/src/domain/entity/tafsir.dart';

class TafsirModel extends Tafsir {
  TafsirModel.fromJson(Map<String, dynamic> json)
      : super(
          ayat: json['ayat'],
          text: json['teks'],
        );
  static List<TafsirModel> parseFromJsom(dynamic jsonMap) =>
      List<TafsirModel>.from(jsonMap.map((x) => TafsirModel.fromJson(x)));
}
