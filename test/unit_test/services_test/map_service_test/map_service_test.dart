import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kissanmitra/services/map_service/map_service.dart';
import 'package:mocktail/mocktail.dart';

class MockMapService extends Mock implements MapService {}

void main() {
  late MockMapService mockMapService;
  setUp(() {
    mockMapService = MockMapService();
  });
  group("Checking the getTile() Fn", () {
    Tile tile = Tile(0, 0, Uint8List.fromList([1, 2, 3]));
    test("Check if fn called or not", () {
      when(() => mockMapService.getTile(1, 1, 1)).thenAnswer((_) async {
        return tile;
      });
      verifyNever(() => mockMapService.getTile(1, 1, 1));
      mockMapService.getTile(1, 1, 1);
      verify(() => mockMapService.getTile(1, 1, 1)).called(1);
    });

    test("Check for correck value", () async {
      when(() => mockMapService.getTile(1, 1, 1))
          .thenAnswer((invocation) async {
        return tile;
      });
      expect(await mockMapService.getTile(1, 1, 1), tile);
    });
  });
}
