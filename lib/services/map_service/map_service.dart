import 'dart:typed_data';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kissanmitra/apis/map_data_apis/map_api.dart';

class MapService implements TileProvider {
  Tile transTile = Tile(0, 0, Uint8List.fromList([1]));

  final String mapType;
  int tileSize = 256;
  MapService({this.mapType = "temp_new"});

  @override
  Future<Tile> getTile(int x, int y, int? zoom) async {
    zoom = zoom ?? 1;
    if (zoom >= 1 && zoom <= 20) {
      final bytes = await getMapDatafromApis(mapType, zoom, x, y);
      return Tile(tileSize, tileSize, bytes);
    }
    return transTile;
  }
}
