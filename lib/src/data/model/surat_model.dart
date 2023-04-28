import 'package:e_quran_id/src/data/model/ayat_model.dart';
import 'package:e_quran_id/src/data/model/tafsir_model.dart';

import '../../domain/entity/surat.dart';

class SuratModel extends Surat {
  SuratModel.fromJson(Map<String, dynamic> json)
      : super(
            nomor: json['nomor'],
            nama: json['nama'],
            namaLatin: json['namaLatin'],
            jumlahAyat: json['jumlahAyat'],
            tempatTurun: json['tempatTurun'],
            arti: json['arti'],
            deskripsi: json['deskripsi'],
            audioFulls: List<String>.from(json['audioFull'].values),
            ayats: AyatModel.parseFromJsom((json['ayat'] ?? [])),
            tafsirs: TafsirModel.parseFromJsom((json['tafsir'] ?? [])));
  static List<SuratModel> parseFromJsom(dynamic jsonMap) =>
      List<SuratModel>.from(jsonMap.map((x) => SuratModel.fromJson(x)));
}
