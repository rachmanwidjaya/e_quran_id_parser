import 'package:e_quran_id/e_quran_id.dart';
import 'package:example/context_extension.dart';
import 'package:example/controller_state.dart';
import 'package:example/handle_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'enum.dart';

class ReadState extends ControllerState {
  ViewMode viewMode;
  Surat surat;
  ReadState({
    required this.viewMode,
    required this.surat,
  });
}

class ReadPage extends StatefulWidget {
  final Surat surat;
  const ReadPage({
    super.key,
    required this.surat,
  });

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  ReadState state = ReadState(
    viewMode: ViewMode.ayat,
    surat: Surat(),
  );
  @override
  void initState() {
    loadAyat();
    super.initState();
  }

  loadAyat() async {
    try {
      state.viewMode = ViewMode.ayat;
      state.viewState = ViewState.loading;
      setState(() {});
      state.surat = await EQuranID.getSurat(nomorSurat: widget.surat.nomor);
      state.viewState = ViewState.sucsess;
      setState(() {});
    } catch (e) {
      state.viewState = ViewState.error;
      state.message = '$e';
      setState(() {});
    }
  }

  loadTafsir() async {
    try {
      state.viewMode = ViewMode.tafsir;
      state.viewState = ViewState.loading;
      setState(() {});
      state.surat = state.surat.copyWith(
        tafsirs:
            (await EQuranID.getTafsir(nomorSurat: widget.surat.nomor)).tafsirs,
      );
      state.viewState = ViewState.sucsess;
      setState(() {});
    } catch (e) {
      state.viewState = ViewState.error;
      state.message = '$e';
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surat.namaLatin),
      ),
      body: Column(
        children: [
          Expanded(
            child: HandleViewState(
              state: state,
              onReload: () {
                state.viewMode == ViewMode.ayat ? loadTafsir() : loadAyat();
              },
              child: state.viewMode == ViewMode.ayat
                  ? ListView.builder(
                      itemCount: state.surat.ayats.length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildSuratInfo(state.surat),
                              _buildAyat(state.surat.ayats[index])
                            ],
                          ); //Start Widget
                        } else if (index == state.surat.ayats.length + 1) {
                          return Column(
                            children: [
                              _buildAyat(state.surat.ayats[index]),
                              const SizedBox(),
                            ],
                          ); //END WIdget Scroollable
                        } else {
                          return _buildAyat(state.surat.ayats[index]);
                        }
                      },
                    )
                  : ListView.builder(
                      itemCount: state.surat.tafsirs.length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildSuratInfo(state.surat),
                              _buildTafsir(
                                state.surat.tafsirs[index],
                                state.surat.ayats[index],
                              )
                            ],
                          ); //Start Widget
                        } else if (index == state.surat.ayats.length + 1) {
                          return Column(
                            children: [
                              _buildTafsir(
                                state.surat.tafsirs[index],
                                state.surat.ayats[index],
                              ),
                              const SizedBox(),
                            ],
                          ); //END WIdget Scroollable
                        } else {
                          return _buildTafsir(
                            state.surat.tafsirs[index],
                            state.surat.ayats[index],
                          );
                        }
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTafsir(Tafsir tafsir, Ayat ayat) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.sizeWidth,
                  child: Text(
                    ayat.teksArab,
                    textAlign: TextAlign.end,
                    style: context.readFont,
                  ),
                ),
                const Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(padding: EdgeInsets.all(4)),
                    Text(
                      '${ayat.nomorAyat}. ${ayat.teksLatin}',
                      style: context.textTheme.bodyLarge,
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                    Text(
                      '${ayat.nomorAyat}. ${ayat.teksIndonesia}',
                    ),
                  ],
                ),
                const Divider(),
                Text(
                  tafsir.text,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSuratInfo(Surat surat) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            children: [
              Text(
                surat.nama,
                style: context.arabTitleFont,
              ),
              Text(
                surat.namaLatin,
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: context.textColor,
                ),
              ),
              const Padding(padding: EdgeInsets.all(4)),
              Text(surat.arti)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Jumlah Ayat:',
                    style: context.textTheme.bodyLarge,
                  ),
                  Text(surat.jumlahAyat.toString())
                ],
              ),
              const Padding(padding: EdgeInsets.all(4)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Diturunkan di:',
                    style: context.textTheme.bodyLarge,
                  ),
                  Text(surat.tempatTurun)
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: HtmlWidget(surat.deskripsi),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              state.viewMode == ViewMode.ayat ? loadTafsir() : loadAyat();
            },
            child: Text(state.viewMode == ViewMode.ayat
                ? 'Lihat Tafsir'
                : 'Lihat Ayat'),
          ),
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildAyat(Ayat ayat) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Container(
              padding: const EdgeInsets.all(12),
              width: context.sizeWidth,
              child: Column(
                children: [
                  SizedBox(
                    width: context.sizeWidth,
                    child: Text(
                      ayat.teksArab,
                      textAlign: TextAlign.end,
                      style: context.readFont,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  SizedBox(
                    width: context.sizeWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(padding: EdgeInsets.all(4)),
                        Text(
                          '${ayat.nomorAyat}. ${ayat.teksLatin}',
                          style: context.textTheme.bodyLarge,
                        ),
                        const Padding(padding: EdgeInsets.all(8)),
                        Text(
                          '${ayat.nomorAyat}. ${ayat.teksIndonesia}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
