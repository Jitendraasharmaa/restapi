import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _StateGooglemapScreen();
}

class _StateGooglemapScreen extends State<GoogleMapScreen> {
  LatLng myLatLong = const LatLng(12.9422418, 77.5563601);
  String address = "Bangalore";

  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(12.9422418, 77.5563601),
  //   zoom: 12,
  // );

  setMarker(LatLng value) async {
    myLatLong = value;
    List<Placemark> result =
        await placemarkFromCoordinates(value.latitude, value.longitude);
    if (result.isNotEmpty) {
      address =
          '${result[0].street} ${result[0].locality} ${result[0].administrativeArea}, ${result[0].country}';
    }
    setState(() {});
    Fluttertoast.showToast(msg: '📍 $address');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 4,
        title: const Text("Google Map"),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 500,
            child: GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: myLatLong, zoom: 12),
              markers: {
                Marker(
                  infoWindow: InfoWindow(title: address),
                  position: myLatLong,
                  markerId: const MarkerId("1"),
                  draggable: true,
                  onDragEnd: (value) {
                    setMarker(value);
                  },
                ),
              },
              onTap: (value) {
                setMarker(value);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ListTile(
                title: Text(address),
                subtitle: Text("${myLatLong.latitude}, ${myLatLong.longitude}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
