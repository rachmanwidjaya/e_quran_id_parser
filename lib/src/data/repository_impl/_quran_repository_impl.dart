part of e_quran_id;

class _QuranRepositoryImpl extends _QuranRepository {
  static final _ApiRepository _apiRepository = _ApiRepositoryImpl.instance;
  static final _singleton = _QuranRepositoryImpl();
  static _QuranRepositoryImpl get instance => _singleton;
  static const String _endPoint = 'https://equran.id/api/v2/';
  @override
  Future<List<Surat>> getAllSurat() async {
    try {
      return await _apiRepository
          .request('${_endPoint}surat')
          .then((res) => SuratModel.parseFromJsom(jsonDecode(res)['data']));
    } catch (e, s) {
      log('$e', error: e, stackTrace: s);
      throw AppException(message: 'Gagal mendapatkan Data', data: e);
    }
  }

  @override
  Future<Surat> getSurat({required int nomorSurat}) async {
    try {
      return await _apiRepository
          .request('${_endPoint}surat/$nomorSurat')
          .then((res) => SuratModel.fromJson(jsonDecode(res)['data']));
    } catch (e, s) {
      log('$e', error: e, stackTrace: s);
      throw AppException(message: 'Gagal mendapatkan Data', data: e);
    }
  }

  @override
  Future<Surat> getTafsir({required int nomorSurat}) async {
    try {
      return await _apiRepository
          .request('${_endPoint}tafsir/$nomorSurat')
          .then((res) => SuratModel.fromJson(jsonDecode(res)['data']));
    } catch (e, s) {
      log('$e', error: e, stackTrace: s);
      throw AppException(message: 'Gagal mendapatkan Data', data: e);
    }
  }
}
