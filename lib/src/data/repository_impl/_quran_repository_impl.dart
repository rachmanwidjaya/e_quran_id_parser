part of e_quran_id;

class _QuranRepositoryImpl extends _QuranRepository {
  static final _singleton = _QuranRepositoryImpl();
  static _QuranRepositoryImpl get instance => _singleton;
  static const String _endPoint = 'https://equran.id/api/v2/';
  @override
  Future<List<Surat>> getAllSurat({
    required _ApiRepository repository,
  }) async {
    try {
      return await repository
          .request('${_endPoint}surat')
          .then((res) => SuratModel.parseFromJsom(jsonDecode(res)['data']));
    } catch (e, s) {
      throw AppException.handleError(e, s);
    }
  }

  @override
  Future<Surat> getSurat(
      {required _ApiRepository repository, required int nomorSurat}) async {
    try {
      return await repository
          .request('${_endPoint}surat/$nomorSurat')
          .then((res) => SuratModel.fromJson(jsonDecode(res)['data']));
    } catch (e, s) {
      throw AppException.handleError(e, s);
    }
  }

  @override
  Future<Surat> getTafsir(
      {required _ApiRepository repository, required int nomorSurat}) async {
    try {
      return await repository
          .request('${_endPoint}tafsir/$nomorSurat')
          .then((res) => SuratModel.fromJson(jsonDecode(res)['data']));
    } catch (e, s) {
      throw AppException.handleError(e, s);
    }
  }
}
