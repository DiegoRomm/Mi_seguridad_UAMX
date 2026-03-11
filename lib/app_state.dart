import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;
  set currentLocation(LatLng? value) {
    _currentLocation = value;
  }

  bool _isInsideArea = false;
  bool get isInsideArea => _isInsideArea;
  set isInsideArea(bool value) {
    _isInsideArea = value;
  }

  String _ubicacionTexto = '';
  String get ubicacionTexto => _ubicacionTexto;
  set ubicacionTexto(String value) {
    _ubicacionTexto = value;
  }
}
