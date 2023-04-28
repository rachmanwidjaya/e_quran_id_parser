import 'package:e_quran_id/e_quran_id.dart';
import 'package:example/context_extension.dart';
import 'package:example/controller_state.dart';
import 'package:example/enum.dart';
import 'package:example/read_page.dart';
import 'package:flutter/material.dart';

import 'handle_view_state.dart';

class HomeState extends ControllerState {
  List<Surat> suratList;
  HomeState({required this.suratList});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeState state = HomeState(suratList: []);
  @override
  void initState() {
    load();
    super.initState();
  }

  load() async {
    try {
      state.viewState = ViewState.loading;
      setState(() {});
      state.suratList = await EQuranID.getAllSurat();
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
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: HandleViewState(
              state: state,
              child: ListView.builder(
                itemCount: state.suratList.length,
                itemBuilder: (contex, index) {
                  return _buildSuratItem(state.suratList[index]);
                },
              ),
              onReload: () {
                load();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuratItem(Surat surat) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ReadPage(
                  surat: surat,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '${surat.nomor}',
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(surat.namaLatin,
                            style: context.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                        Text('${surat.arti} (${surat.jumlahAyat})')
                      ],
                    ),
                  ],
                ),
                Text(
                  surat.nama,
                  style: context.arabTitleFont1,
                ),
              ],
            ),
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
