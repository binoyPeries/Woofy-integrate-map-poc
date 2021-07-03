import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart' as latLng;

class FlutterMapLib extends StatefulWidget {
  const FlutterMapLib({Key? key}) : super(key: key);

  @override
  _FlutterMapLibState createState() => _FlutterMapLibState();
}

class _FlutterMapLibState extends State<FlutterMapLib> {
  var locationDetails = [
    [6.927079, 79.861244],
    [6.585395, 79.960739],
    [6.8301, 79.8801],
    [6.720229, 79.930463],
    [6.773, 79.8816],
    [6.7132, 79.9026],
    [7.2955, 80.6356],
    [6.9895, 81.0557]
  ];
  List<Marker> generateMarkers() {
    List<Marker> markers = [];
    for (var loc in locationDetails) {
      markers.add(
        Marker(
          point: latLng.LatLng(loc[0], loc[1]),
          builder: (context) => Container(
            child: Icon(
              FontAwesomeIcons.mapMarkerAlt,
              size: 30.0,
              color: Colors.red,
            ),
          ),
        ),
      );
    }
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
      ),
      body: FlutterMap(
        options: MapOptions(
          plugins: [
            MarkerClusterPlugin(),
          ],
          center: latLng.LatLng(6.927079, 79.861244),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerClusterLayerOptions(
            markers: generateMarkers(),
            polygonOptions: PolygonOptions(
                borderColor: Colors.blueAccent,
                color: Colors.black12,
                borderStrokeWidth: 3),
            builder: (context, markers) {
              return FloatingActionButton(
                backgroundColor: Colors.green,
                child: Text(markers.length.toString()),
                onPressed: null,
              );
            },
          )
          // MarkerLayerOptions(
          //   markers: generateMarkers(),
          // ),
        ],
      ),
    );
  }
}
