import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kissanmitra/utils/constants.dart';

Future<Uint8List> getMapDatafromApis(mapType, zoom, x, y) async {
  final uri = Uri.parse(
      "https://tile.openweathermap.org/map/$mapType/$zoom/$x/$y.png?appid=$apiKey");
  try {
    final ByteData imageData = await NetworkAssetBundle(uri).load("");
    final Uint8List bytes = imageData.buffer.asUint8List();
    return bytes;
  } catch (e) {
    return Future.error(e);
  }
}
