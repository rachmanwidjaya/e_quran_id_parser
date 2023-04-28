library e_quran_id;

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'src/core/app_exception.dart';
import 'src/data/model/surat_model.dart';
import 'src/domain/entity/surat.dart';
export 'src/domain/entity/ayat.dart';
export 'src/domain/entity/surat.dart';
export 'src/domain/entity/tafsir.dart';

part 'src/domain/repository/_api_repository.dart';
part 'src/data/repository_impl/_api_repository_impl.dart';
part 'src/domain/repository/_quran_repository.dart';
part 'src/data/repository_impl/_quran_repository_impl.dart';

class EQuranID {
  static final _QuranRepository _quranRepository =
      _QuranRepositoryImpl.instance;
  static final _ApiRepository _apiRepository = _ApiRepositoryImpl.instance;
  // static final Kemenag kemenag = Kemenag();

  /// ## Bonus Feature
  /// this feature is made using `'dart:io'` libraries
  ///
  /// You can use this method like this:
  ///
  /// ```dart
  ///String res = await EQuranID.apiRequest(
  ///   'https://example.com/target/',
  ///   method: HTTPMethod.post //default get if null
  ///   headers: {
  ///     "User-agent":"QURAN-LIB", //example header
  ///   },
  ///   body: {
  ///     "id": 1,
  ///     "name":"QURAN-LIB",
  ///   }
  ///);
  ///
  /// ```
  ///
  /// **Notes:**
  ///
  ///
  ///This method will return an:
  ///```dart
  ///   throw AppException
  ///```
  ///if an error occurs.
  ///
  ///you have to handle the exception!
  static Future<String> apiRequest(
    String endPoint, {
    HTTPMethod? method,
    Map<String, String>? headers,
    dynamic body,
  }) async =>
      await _apiRepository.request(
        endPoint,
        method: method,
        headers: headers,
        body: body,
      );

  /// You can use this method like this:
  ///
  /// ```dart
  ///   List<Surat> suratList= await EQuranID.getAllSurat();
  ///
  /// ```
  /// **Notes:**
  ///
  ///This method will return an:
  ///```dart
  ///   throw AppException
  ///```
  ///if an error occurs.
  ///
  ///you have to handle the exception!
  static Future<List<Surat>> getAllSurat() async =>
      await _quranRepository.getAllSurat();

  /// You can use this method like this:
  ///
  /// ```dart
  ///   Surat surat = await EQuranID.getSurat(nomorSurat: 1);
  ///
  /// ```
  /// **Notes:**
  ///
  ///This method will return an:
  ///```dart
  ///   throw AppException
  ///```
  ///if an error occurs.
  ///
  ///you have to handle the exception!
  static Future<Surat> getSurat({required int nomorSurat}) async =>
      await _quranRepository.getSurat(nomorSurat: nomorSurat);

  /// You can use this method like this:
  ///
  /// ```dart
  ///   Surat surat = await EQuranID.getSurat(nomorSurat: 1);
  ///
  /// ```
  /// **Notes:**
  ///
  ///This method will return an:
  ///```dart
  ///   throw AppException
  ///```
  ///if an error occurs.
  ///
  ///you have to handle the exception!
  static Future<Surat> getTafsir({required int nomorSurat}) async =>
      await _quranRepository.getTafsir(nomorSurat: nomorSurat);
}
