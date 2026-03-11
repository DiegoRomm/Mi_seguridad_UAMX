// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geolocator/geolocator.dart'; // Necesario para distanceBetween

Future<bool> isInAllowedArea(LatLng currentLocation) async {
  const double targetLat = 19.3105;
  const double targetLng = -99.0799;

  const double maxDistanceMeters = 500;

  final double distance = Geolocator.distanceBetween(
    currentLocation.latitude,
    currentLocation.longitude,
    targetLat,
    targetLng,
  );

  return distance <= maxDistanceMeters;
}
