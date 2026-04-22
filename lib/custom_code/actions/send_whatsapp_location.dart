// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:url_launcher/url_launcher.dart';

Future<void> sendWhatsappLocation() async {
  final location = FFAppState().currentLocation;

  if (location == null) {
    throw Exception('Ubicación no disponible.');
  }

  final lat = location.latitude;
  final lng = location.longitude;
  final mensaje = '¡Ayuda! Estoy aquí: https://www.google.com/maps?q=$lat,$lng';
  final numero = '525574326309';
  final texto = Uri.encodeComponent(mensaje);

  // Intentar primero con esquema nativo whatsapp://
  final whatsappUri = Uri.parse('whatsapp://send?phone=$numero&text=$texto');
  if (await canLaunchUrl(whatsappUri)) {
    await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    return;
  }

  // Fallback: abrir vía web wa.me (funciona aunque WhatsApp no esté instalado)
  final webUri = Uri.parse('https://wa.me/$numero?text=$texto');
  await launchUrl(webUri, mode: LaunchMode.externalApplication);
}
