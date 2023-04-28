// ignore_for_file: avoid_print

import 'package:e_quran_id/e_quran_id.dart';

void main() async {
  await EQuranID.getSurat(nomorSurat: 1).then((value) => print(value));
  await EQuranID.getTafsir(nomorSurat: 1).then((value) => print(value));
  await EQuranID.getAllSurat().then((value) => print(value));
}
