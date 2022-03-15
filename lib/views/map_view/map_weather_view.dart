import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kissanmitra/services/map_service/map_service.dart';

class MapWeatherView extends StatefulWidget {
  const MapWeatherView({Key? key}) : super(key: key);

  @override
  _MapWeatherViewState createState() => _MapWeatherViewState();
}

class _MapWeatherViewState extends State<MapWeatherView> {
  late GoogleMapController mapController;

  final LatLng latLng = const LatLng(0.0, 0.0);

  bool _isTempMap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isTempMap = !_isTempMap;
          });
        },
        isExtended: true,
        child: Icon(
          !_isTempMap ? Icons.local_fire_department : Icons.cloud,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: GoogleMap(
        tileOverlays: {
          _isTempMap
              ? TileOverlay(
                  tileOverlayId: const TileOverlayId('precipitation_new_id'),
                  tileProvider: MapService(mapType: "precipitation_new"),
                )
              : TileOverlay(
                  tileOverlayId: const TileOverlayId('temp_new_id'),
                  tileProvider: MapService(mapType: "temp_new"),
                )
        },
        onMapCreated: setControler,
        initialCameraPosition: CameraPosition(
          target: latLng,
          zoom: 1,
        ),
      ),
    );
  }

  void setControler(GoogleMapController controller) {
    mapController = controller;
  }
}
