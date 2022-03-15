import 'package:geolocator/geolocator.dart';
import 'package:kissanmitra/utils/constants.dart';

class LocationService {
  Future<Position> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        lat = 0.0;
        lon = 0.0;
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      lat = 0.0;
      lon = 0.0;
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    lat = -1.0;
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
