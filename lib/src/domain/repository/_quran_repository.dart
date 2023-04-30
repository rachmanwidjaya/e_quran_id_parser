part of e_quran_id;

abstract class _QuranRepository {
  Future<List<Surat>> getAllSurat({
    required _ApiRepository repository,
  });
  Future<Surat> getSurat({
    required _ApiRepository repository,
    required int nomorSurat,
  });
  Future<Surat> getTafsir({
    required _ApiRepository repository,
    required int nomorSurat,
  });
}
