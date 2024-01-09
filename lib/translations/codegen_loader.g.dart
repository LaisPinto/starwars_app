// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_US = {
  "Screen": {
    "detail": {
      "title": "Character",
      "loading": "Loading...",
      "name": "Name",
      "gender": "Gender",
      "birthYear": "Birthday year",
      "eyeColor": "Eye color",
      "hairColor": "Hair color",
      "height": "Height",
      "mass": "Body mass",
      "skinColor": "Skin color"
    }
  }
};
static const Map<String,dynamic> pt_BR = {
  "Screen": {
    "detail": {
      "title": "Character",
      "loading": "Carregando...",
      "name": "Nome: ",
      "gender": "Genero: ",
      "birthYear": "Ano de aniversario: ",
      "eyeColor": "Cor dos olhos: ",
      "hairColor": "Cor do cabelo: ",
      "height": "Altura: ",
      "mass": "Massa: ",
      "skinColor": "Cor da pele: "
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US, "pt_BR": pt_BR};
}
