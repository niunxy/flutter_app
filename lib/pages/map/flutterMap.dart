import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
// import 'package:vector_map_tiles/vector_map_tiles.dart';
// import 'package:vector_tile_renderer/vector_tile_renderer.dart' hide TileLayer;

class MyFlutterMap extends StatefulWidget {
  const MyFlutterMap({super.key});

  @override
  State<MyFlutterMap> createState() => _MyFlutterMapState();
}

class _MyFlutterMapState extends State<MyFlutterMap> {
  // final MapController _controller = MapController();
  // Style? _style;
  // Object? _error;
  double simplificationTolerance = 0.3;

  final _randomWalk = [const LatLng(44.861294, 13.845086)];
  @override
  void initState() {
    super.initState();
    final random = Random(1234);
    for (int i = 1; i < 300000; i++) {
      final lat = (random.nextDouble() - 0.5) * 0.001;
      final lon = (random.nextDouble() - 0.6) * 0.001;
      _randomWalk.add(
        LatLng(
          _randomWalk[i - 1].latitude + lat,
          _randomWalk[i - 1].longitude + lon,
        ),
      );
    }
    // _initStyle();
  }

  // void _initStyle() async {
  //   try {
  //     _style = await _readStyle();
  //   } catch (e, stack) {
  //     // ignore: avoid_print
  //     print(e);
  //     // ignore: avoid_print
  //     print(stack);
  //   }
  //   setState(() {});
  // }

  // Future<Style> _readStyle() => StyleReader(
  //       uri:
  //           'https://tiles.stadiamaps.com/styles/osm_bright.json?api_key={04eca38a-4423-45c6-b0ec-2b622851f8f8}',
  //       apiKey: '04eca38a-4423-45c6-b0ec-2b622851f8f8',
  //       // logger: const Logger.console(),
  //     ).read();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.teal,
        child: FlutterMap(
          // mapController: _controller,
          options: MapOptions(
            initialCenter: LatLng(51.5, -0.09),
            initialZoom: 5.0,
          ),
          children: [
            /* TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ) */
            TileLayer(
                    urlTemplate: 'https://server.arcgisonline.com/arcgis/rest/services/World_Street_Map/MapServer/tile/{z}/{x}/{y}',
                  ),
            /* TileLayer(
              wmsOptions: WMSTileLayerOptions(
                baseUrl: 'https://tiles.maps.eox.at/wms?',
                layers: const ['s2cloudless-2021_3857'],
              ),
              subdomains: const ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'],
              userAgentPackageName: 'com.example.niun1',
            ), */
            /* VectorTileLayer(
              theme: _style!.theme,
              sprites: _style?.sprites,
              // tileOffset: TileOffset.mapbox, enable with mapbox
              tileProviders: _style!.providers,
            ), */
            // TileLayer(
            //   // Bring your own tiles
            //   urlTemplate:
            //       'https://t4.tianditu.gov.cn/DataServer?T=img_c&X={x}&Y={y}&L={z}&tk=75bfac89cea1c5aa68cc6fb8670581c0', // For demonstration only
            //   // And many more recommended properties!
            // ),
            PolylineLayer(
              simplificationTolerance: simplificationTolerance,
              polylines: [
                Polyline(
                  points: _randomWalk,
                  strokeWidth: 3,
                  color: Colors.deepOrange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
