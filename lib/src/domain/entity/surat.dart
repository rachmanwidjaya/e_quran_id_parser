import 'dart:convert';

import 'package:e_quran_id/src/domain/entity/ayat.dart';
import 'package:e_quran_id/src/domain/entity/tafsir.dart';

///```dart
///Surat({
///    int nomor = 0,
///    String nama = '',
///    String namaLatin = '',
///    int jumlahAyat = 0,
///    String tempatTurun = '',
///    String arti = '',
///    String deskripsi = '',
///    Map<String, dynamic> audioFulls = const {},
///    Ayat ayats = const [],
///    Tafsir tafsirs = const [],
///  });
///```

class Surat {
  Surat({
    this.nomor = 0,
    this.nama = '',
    this.namaLatin = '',
    this.jumlahAyat = 0,
    this.tempatTurun = '',
    this.arti = '',
    this.deskripsi = '',
    this.audioFulls = const [],
    this.ayats = const [],
    this.tafsirs = const [],
  });

  ///This object is the sequence of a letter.
  ///For example Al-Fatihah is the 1st letter. then this number contains 1
  ///Example
  ///```dart
  ///Surat(
  ///   nomor: 1, //this
  ///   nama: "الفاتحة",
  ///   namaLatin: "Al-Fatihah",
  ///   jumlahAyat: 7,
  ///   tempatTurun: "Mekah",
  ///   arti: "Pembukaan",
  ///   deskripsi: "Surat <i>Al Faatihah</i> (Pembukaan...",
  ///)
  ///```
  ///use this number for request rest api.
  ///
  ///`example:`
  ///```dart
  ///Surat mySurat = await EQuranID.getSurat(nomorSurat: mySuratList[index].nomor);
  ///```
  final int nomor;

  ///This object will contain Arabic letters. use a font that supports Arabic letters for presentation purposes
  ///`Example:`
  ///```dart
  ///Surat(
  ///   nama: "الفاتحة", //this
  ///)
  ///```
  final String nama;

  ///This object will contain the Latin name of a letter
  ///
  ///`Example:`
  ///```dart
  ///Surat(
  ///   namaLatin: "Al-Fatihah", //this
  ///)
  ///```
  final String namaLatin;

  ///This object will contain the number of verses of a letter.
  ///
  ///`Example:`
  ///```dart
  ///Surat(
  ///   namaLatin: "Al-Fatihah",
  ///   jumlahAyat: 7, //this
  ///)
  ///```
  final int jumlahAyat;

  ///This object will contain a string about where this surah was revealed.
  ///
  ///`Example:`
  ///```dart
  ///Surat(
  ///   namaLatin: "Al-Fatihah",
  ///   tempatTurun: "Mekah", //this
  ///)
  ///```
  final String tempatTurun;

  ///This object will contain the translation/meaning of a surah.
  ///
  ///`Example:`
  ///```dart
  ///Surat(
  ///   namaLatin: "Al-Fatihah",
  ///   arti: "Pembukaan", //this
  ///)
  ///```
  final String arti;

  ///This object will contain a description of a chapter/surah.
  ///`Example:`
  ///```dart
  ///Surat(
  ///   namaLatin: "Al-Fatihah",
  ///   deskripsi: "Surat <i>Al Faatihah</i> (Pembukaan...", //this
  ///)
  ///```
  final String deskripsi;

  ///This object will contain a list of audio links. You can use this for playing or downloading audio of a surah.
  ///
  ///`Example:`
  ///```dart
  ///Surat(
  ///   namaLatin: "Al-Fatihah",
  ///   audioFulls: [
  ///      "https://equran.nos.wjv-1.neo.id/audio-full/Abdullah-Al-Juhany/001.mp3",
  ///      "https://equran.nos.wjv-1.neo.id/audio-full/Abdul-Muhsin-Al-Qasim/001.mp3",
  ///      "https://equran.nos.wjv-1.neo.id/audio-full/Abdurrahman-as-Sudais/001.mp3",
  ///      "https://equran.nos.wjv-1.neo.id/audio-full/Ibrahim-Al-Dossari/001.mp3",
  ///      "https://equran.nos.wjv-1.neo.id/audio-full/Misyari-Rasyid-Al-Afasi/001.mp3"
  ///   ], //this
  ///)
  ///```
  final List<String> audioFulls;

  ///This object will contain a list of Object ``Ayat()`` from a surah.
  ///
  ///`Example:`
  ///```dart
  ///Surat(
  ///   namaLatin: "Al-Fatihah",
  ///   ayats: [
  ///     Ayat(
  ///       nomorAyat: 1,
  ///       teksArab: "اِذَا جَاۤءَ نَصْرُ اللّٰهِ وَالْفَتْحُۙ",
  ///       teksLatin: "iżā jā'a naṣrullāhi wal-fatḥ(u).",
  ///       teksIndonesia: "Apabila telah datang pertolongan Allah dan kemenangan,",
  ///       audio: [
  ///         //List of audio
  ///       ]
  ///     ), //this
  ///     Ayat(
  ///       //More
  ///     ), //this
  ///   ]
  ///)
  ///```
  final List<Ayat> ayats;

  ///This object will contain a list of Object ``Tafsir()`` from a surah.
  ///
  ///`Example:`
  ///```dart
  ///Surat(
  ///   namaLatin: "An-Nasr",
  ///   tafsirs: [
  ///     Tafsir(
  ///      ayat: 1,
  ///      teks: "Dalam ayat-ayat ini, Allah memerintahkan apa yang..."

  ///     ), //this
  ///     Tafsir(
  ///       //More
  ///     ),
  ///   ]
  ///)
  ///```
  final List<Tafsir> tafsirs;

  Surat copyWith({
    int? nomor,
    String? nama,
    String? namaLatin,
    int? jumlahAyat,
    String? tempatTurun,
    String? arti,
    String? deskripsi,
    List<String>? audioFulls,
    List<Ayat>? ayats,
    List<Tafsir>? tafsirs,
  }) =>
      Surat(
        nomor: nomor ?? this.nomor,
        nama: nama ?? this.nama,
        namaLatin: namaLatin ?? this.namaLatin,
        jumlahAyat: jumlahAyat ?? this.jumlahAyat,
        tempatTurun: tempatTurun ?? this.tempatTurun,
        arti: arti ?? this.arti,
        deskripsi: deskripsi ?? this.deskripsi,
        audioFulls: audioFulls ?? this.audioFulls,
        ayats: ayats ?? this.ayats,
        tafsirs: tafsirs ?? this.tafsirs,
      );

  ///this method will return:
  ///```dart
  ///{
  ///   "nomor": nomor,
  ///   "nama": nama,
  ///   "namaLatin": namaLatin,
  ///   "jumlahAyat": jumlahAyat,
  ///   "tempatTurun": tempatTurun,
  ///   "arti": arti,
  ///   "deskripsi": deskripsi,
  ///   "audioFulls": audioFull,
  ///   "ayats": [
  ///        {
  ///           "nomorAyat": nomorAyat,
  ///           "teksArab": teksArab,
  ///           "teksLatin": teksLatin,
  ///           "teksIndonesia": teksIndonesia,
  ///           "audios": audios,
  ///        }
  ///     ],
  ///   "tafsirs": [
  ///       {
  ///           "ayat": ayat,
  ///           "text": text,
  ///       }
  ///     ]
  ///}
  /// ```
  Map<String, dynamic> toMap() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audioFulls": audioFulls,
        "ayats": ayats.toMap(),
        "tafsirs": tafsirs.toMap(),
      };
  @override
  String toString() => jsonEncode(toMap());
}

extension ListSuratExtension on List<Surat> {
  ///this method will return:
  ///```dart
  ///[{
  ///   "nomor": nomor,
  ///   "nama": nama,
  ///   "namaLatin": namaLatin,
  ///   "jumlahAyat": jumlahAyat,
  ///   "tempatTurun": tempatTurun,
  ///   "arti": arti,
  ///   "deskripsi": deskripsi,
  ///   "audioFulls": audioFull,
  ///   "ayats": [
  ///        {
  ///           "nomorAyat": nomorAyat,
  ///           "teksArab": teksArab,
  ///           "teksLatin": teksLatin,
  ///           "teksIndonesia": teksIndonesia,
  ///           "audios": audios,
  ///        }
  ///     ],
  ///   "tafsirs": [
  ///       {
  ///           "ayat": ayat,
  ///           "text": text,
  ///       }
  ///     ]
  ///}]
  /// ```
  List<Map<String, dynamic>> toMap() =>
      List<Map<String, dynamic>>.from(map((e) => e.toMap()));
}
