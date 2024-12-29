import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../../data/models/marker_data.dart';

class MapViewSetLocation extends StatefulWidget {
  const MapViewSetLocation({super.key});

  @override
  State<MapViewSetLocation> createState() => _MapViewSetLocationState();
}

class _MapViewSetLocationState extends State<MapViewSetLocation> {
  final MapController _mapController = MapController();
  final List<MarkerData> _markerData = []; //
  final List<Marker> _markers = []; //
  LatLng? _selectedPosition;
  LatLng? _mylocation;
  LatLng? _draggedPosition;
  bool _isDragging = false;
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResults = [];
  bool _isSearching = false;

//يجيب الموقع الحالي
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location services are disabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permissions are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permissions are permanetly denied");
    }

    return await Geolocator.getCurrentPosition();
  }

  //عرض الموقع الحالي

  void _showCurrentLocation() async {
    try {
      final Position position = await _determinePosition();
      final LatLng currentLatLng =
          LatLng(position.latitude, position.longitude);
      _mapController.move(currentLatLng, 15.0);
      setState(() {
        _mylocation = currentLatLng;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

//add marker

  void _addMarker(LatLng position, String title, String description) {
    setState(() {
      final markerData = MarkerData(
          position: position, title: title, description: description);
      if (_markerData.isNotEmpty && _markers.isNotEmpty) {
        _markerData.clear();
        _markers.clear();
      }

      _markerData.add(markerData);
      _markers.add(Marker(
        point: position,
        width: 80,
        height: 80,
        child: GestureDetector(
          onTap: () => _showMarkerInfo(markerData),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      )
                    ]),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(
                Icons.location_on,
                color: Colors.redAccent,
                size: 40,
              ),
            ],
          ),
        ),
      ));
    });
  }

//show marker dialog

  void _showMarkerDialog(BuildContext context, LatLng position) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add Marker"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Title",
              ),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(
                labelText: "Descriotion",
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              _addMarker(position, titleController.text, descController.text);
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  //show marker onfo when click

  void _showMarkerInfo(MarkerData markerData) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(markerData.title),
        content: Text(markerData.description),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
    );
  }

//search feature
  Future<void> _searchPlaces(String query) async {
    try {
      if (query.isEmpty) {
        setState(() {
          _searchResults = [];
        });
        return;
      }
      final url =
          'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=5';

      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body);
      if (data.isNotEmpty) {
        setState(() {
          _searchResults = data;
        });
      } else {
        setState(() {
          _searchResults = [];
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  //move to specific location
  void _moveToLocation(double lat, double lon) {
    final LatLng location = LatLng(lat, lon);

    _mapController.move(location, 15.0);
    setState(() {
      _selectedPosition = location;
      _searchResults = [];
      _isSearching = false;

      _searchController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    _showCurrentLocation();
    _searchController.addListener(
      () {
        _searchPlaces(_searchController.text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialZoom: 13.0,
              initialCenter: const LatLng(51.5, -0.09),
              onTap: (tapPosition, latLng) {
                setState(() {
                  _selectedPosition = latLng;
                  _draggedPosition = _selectedPosition;
                });
              },
            ),
            children: [
              // TileLayer(
              //   urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              // ),
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              ),

              MarkerLayer(markers: _markers),
              if (_isDragging && _draggedPosition != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _draggedPosition!,
                      width: 80,
                      height: 80,
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.indigo,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              if (_mylocation != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _mylocation!,
                      width: 80,
                      height: 80,
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.green,
                        size: 40,
                      ),
                    ),
                  ],
                )
            ],
          ),

          //search widget
          Positioned(
            top: 40,
            left: 15,
            right: 15,
            child: Column(
              children: [
                SizedBox(
                  height: 55,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                        hintText: "Search Place...",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: _isSearching
                            ? IconButton(
                                onPressed: () {
                                  _searchController.clear();
                                  setState(() {
                                    _isSearching = false;
                                    _searchResults = [];
                                  });
                                },
                                icon: const Icon(Icons.clear))
                            : null),
                    onTap: () {
                      setState(() {
                        _isSearching = true;
                      });
                    },
                  ),
                ),
                if (_isSearching && _searchResults.isNotEmpty)
                  Container(
                    color: Colors.white,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _searchResults.length,
                      itemBuilder: (ctx, index) {
                        final place = _searchResults[index];
                        return ListTile(
                          title: Text(place['display_name']),
                          onTap: () {
                            final lat = double.parse(place['lat']);
                            final lon = double.parse(place['lon']);
                            _moveToLocation(lat, lon);
                          },
                        );
                      },
                    ),
                  )
              ],
            ),
          ),
          //add location buttom
          _isDragging == false
              ? Positioned(
                  bottom: 20,
                  left: 20,
                  child: FloatingActionButton(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        _isDragging = true;
                      });
                    },
                    child: const Icon(Icons.add_location),
                  ))
              : Positioned(
                  bottom: 20,
                  left: 20,
                  child: FloatingActionButton(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        _isDragging = false;
                      });
                    },
                    child: const Icon(Icons.wrong_location),
                  ),
                ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.indigo,
                  onPressed: _showCurrentLocation,
                  child: const Icon(Icons.location_searching_rounded),
                ),
                if (_isDragging)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: FloatingActionButton(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      onPressed: () {
                        if (_draggedPosition != null) {
                          _showMarkerDialog(context, _draggedPosition!);
                        }
                        setState(() {
                          _isDragging = false;
                          _draggedPosition = null;
                        });
                      },
                      child: const Icon(Icons.check),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
