import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kissanmitra/services/location_service/location_service.dart';
import 'package:mocktail/mocktail.dart';

class MockLocationService extends Mock implements LocationService {}

void main() {
  late MockLocationService mockLocationService;
  setUp(() {
    mockLocationService = MockLocationService();
  });

  group("Checking the determinePosition() fn", () {
    Position position = Position(
        longitude: 0.0,
        latitude: 0.0,
        timestamp: DateTime.now(),
        accuracy: 0.0,
        altitude: 0.0,
        heading: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0);

    test("check if function is called or not", () {
      when(() => mockLocationService.determinePosition()).thenAnswer((_) async {
        return position;
      });
      verifyNever(() => mockLocationService.determinePosition());
      mockLocationService.determinePosition();
      verify(() => mockLocationService.determinePosition()).called(1);
    });
    test("Check for correck value", () async {
      when(() => mockLocationService.determinePosition())
          .thenAnswer((invocation) async {
        return position;
      });
      expect(await mockLocationService.determinePosition(), position);
    });
  });
}
