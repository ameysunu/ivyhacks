import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

String mobile = '+1(509)126432';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  MapType _currentMapType = MapType.normal;
  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
    setCustomMapPin();
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAsset('images/marker.bmp');
  }

  @override
  Widget build(BuildContext context) {
    LatLng pinPosition = LatLng(30.346687, -97.651901);

    String positionOne = "Anna Stephens";

    CameraPosition initialLocation =
        CameraPosition(zoom: 10, bearing: 30, target: pinPosition);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Hexcolor('#F9F871'),
        title: Text(
          "Therapists",
          style: TextStyle(fontFamily: 'Poppins', color: Hexcolor('#54433A')),
        ),
      ),
      backgroundColor: Hexcolor('#F9F871'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/therapy.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.63,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Card(
                    child: GoogleMap(
                      mapType: _currentMapType,
                      myLocationEnabled: true,
                      markers: _markers,
                      initialCameraPosition: initialLocation,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                        setState(() {
                          _markers.add(Marker(
                              markerId: MarkerId("Anna Stephens"),
                              position: pinPosition,
                              infoWindow: InfoWindow(
                                title: positionOne,
                                snippet: 'Psychatrist',
                              ),
                              icon: pinLocationIcon));
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  color: Colors.transparent,
                  child: Container(
                      decoration: new BoxDecoration(
                          color: Hexcolor('#FFE7D3'),
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0),
                          )),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.network(
                                      "https://i.ibb.co/ky2dZhS/wamen.png"),
                                ),
                              ),
                              Text(
                                "Anna Stephens",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    color: Hexcolor('#000000')),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: RaisedButton(
                                    color: Hexcolor('#7B5298'),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.call,
                                              color: Colors.white),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Call Me",
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {
                                      launch(('tel://$mobile'));
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: RaisedButton(
                                    color: Hexcolor('#7B5298'),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.email,
                                              color: Colors.white),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Email",
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {
                                      _email();
                                    }),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _email() async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: 'anna78@example.com',
  );
  String url = params.toString();
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}
