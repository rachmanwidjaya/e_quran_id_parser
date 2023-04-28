# Al-Quran Api Parser Flutter
### This library is taken from: 

[![N|Solid](https://equran.id/images/graph.png)](https://equran.id/)

## Features

Make it easier to retrieve al-quran data from: https://equran.id/

## Getting started

Go to `/pubspec.yaml` file.


```dart
dependencies:
  flutter:
    sdk: flutter
  quran_lib:
    url: https://github.com/rachmanwidjaya/e_quran_id_parser.git
    ref: main
```
```sh 
flutter pub get
```

## Usage

```dart
import 'package:e_quran_id/e_quran_id.dart';
```
Then you can use This:

- Get all Surat

```dart 
List<Surat> suratList = await QuranLib.getAllSurat();
```
- Get Surat By number 
```dart
Surat surat = await  QuranLib.getSurat(nomorSurat: 1);
```
- Get Tafsir By number
```dart
Surat surat = await  QuranLib.getTafsir(nomorSurat: 1);
```


View [full_example][example]
   
   [example]: <https://github.com/rachmanwidjaya/e_quran_id_parser/tree/main/example/>
