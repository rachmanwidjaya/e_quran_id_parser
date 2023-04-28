part of e_quran_id;

abstract class _QuranRepository {
  Future<List<Surat>> getAllSurat();
  Future<Surat> getSurat({required int nomorSurat});
  Future<Surat> getTafsir({required int nomorSurat});
}
