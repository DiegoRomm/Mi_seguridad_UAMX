import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'crear_cuenta_widget.dart' show CrearCuentaWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CrearCuentaModel extends FlutterFlowModel<CrearCuentaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for Telefono widget.
  FocusNode? telefonoFocusNode;
  TextEditingController? telefonoTextController;
  String? Function(BuildContext, String?)? telefonoTextControllerValidator;
  // State field(s) for contrasena widget.
  FocusNode? contrasenaFocusNode;
  TextEditingController? contrasenaTextController;
  late bool contrasenaVisibility;
  String? Function(BuildContext, String?)? contrasenaTextControllerValidator;
  // State field(s) for contrasenaconfirm widget.
  FocusNode? contrasenaconfirmFocusNode;
  TextEditingController? contrasenaconfirmTextController;
  late bool contrasenaconfirmVisibility;
  String? Function(BuildContext, String?)?
      contrasenaconfirmTextControllerValidator;
  // State field(s) for TelefonoEmergencia widget.
  FocusNode? telefonoEmergenciaFocusNode;
  TextEditingController? telefonoEmergenciaTextController;
  String? Function(BuildContext, String?)?
      telefonoEmergenciaTextControllerValidator;
  // State field(s) for Tipodesangre widget.
  FocusNode? tipodesangreFocusNode;
  TextEditingController? tipodesangreTextController;
  String? Function(BuildContext, String?)? tipodesangreTextControllerValidator;
  // State field(s) for Alergias widget.
  FocusNode? alergiasFocusNode1;
  TextEditingController? alergiasTextController1;
  String? Function(BuildContext, String?)? alergiasTextController1Validator;
  // State field(s) for Medicamentos widget.
  FocusNode? medicamentosFocusNode;
  TextEditingController? medicamentosTextController;
  String? Function(BuildContext, String?)? medicamentosTextControllerValidator;
  // State field(s) for Padecimientos widget.
  FocusNode? padecimientosFocusNode;
  TextEditingController? padecimientosTextController;
  String? Function(BuildContext, String?)? padecimientosTextControllerValidator;
  // State field(s) for Alergias widget.
  FocusNode? alergiasFocusNode2;
  TextEditingController? alergiasTextController2;
  String? Function(BuildContext, String?)? alergiasTextController2Validator;

  @override
  void initState(BuildContext context) {
    contrasenaVisibility = false;
    contrasenaconfirmVisibility = false;
  }

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    telefonoFocusNode?.dispose();
    telefonoTextController?.dispose();

    contrasenaFocusNode?.dispose();
    contrasenaTextController?.dispose();

    contrasenaconfirmFocusNode?.dispose();
    contrasenaconfirmTextController?.dispose();

    telefonoEmergenciaFocusNode?.dispose();
    telefonoEmergenciaTextController?.dispose();

    tipodesangreFocusNode?.dispose();
    tipodesangreTextController?.dispose();

    alergiasFocusNode1?.dispose();
    alergiasTextController1?.dispose();

    medicamentosFocusNode?.dispose();
    medicamentosTextController?.dispose();

    padecimientosFocusNode?.dispose();
    padecimientosTextController?.dispose();

    alergiasFocusNode2?.dispose();
    alergiasTextController2?.dispose();
  }
}
