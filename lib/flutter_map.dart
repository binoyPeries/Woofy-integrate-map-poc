import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

class FlutterMapLib extends StatefulWidget {
  const FlutterMapLib({Key? key}) : super(key: key);

  @override
  _FlutterMapLibState createState() => _FlutterMapLibState();
}

class _FlutterMapLibState extends State<FlutterMapLib> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(6.927079, 79.861244),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 50.0,
                height: 50.0,
                point: latLng.LatLng(6.927079, 79.861244),
                builder: (ctx) => Container(
                  child: FlutterLogo(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
