import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'crear_cuenta_model.dart';
export 'crear_cuenta_model.dart';

class CrearCuentaWidget extends StatefulWidget {
  const CrearCuentaWidget({super.key});

  static String routeName = 'CrearCuenta';
  static String routePath = '/crearCuenta';

  @override
  State<CrearCuentaWidget> createState() => _CrearCuentaWidgetState();
}

class _CrearCuentaWidgetState extends State<CrearCuentaWidget> {
  late CrearCuentaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrearCuentaModel());

    _model.nombreTextController ??= TextEditingController();
    _model.nombreFocusNode ??= FocusNode();

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.telefonoTextController ??= TextEditingController();
    _model.telefonoFocusNode ??= FocusNode();

    _model.contrasenaTextController ??= TextEditingController();
    _model.contrasenaFocusNode ??= FocusNode();

    _model.contrasenaconfirmTextController ??= TextEditingController();
    _model.contrasenaconfirmFocusNode ??= FocusNode();

    _model.telefonoEmergenciaTextController ??= TextEditingController();
    _model.telefonoEmergenciaFocusNode ??= FocusNode();

    _model.tipodesangreTextController ??= TextEditingController();
    _model.tipodesangreFocusNode ??= FocusNode();

    _model.alergiasTextController1 ??= TextEditingController();
    _model.alergiasFocusNode1 ??= FocusNode();

    _model.medicamentosTextController ??= TextEditingController();
    _model.medicamentosFocusNode ??= FocusNode();

    _model.padecimientosTextController ??= TextEditingController();
    _model.padecimientosFocusNode ??= FocusNode();

    _model.alergiasTextController2 ??= TextEditingController();
    _model.alergiasFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  // ── Helper: decoración reutilizable para los campos ──────────────────────
  InputDecoration _inputDeco(BuildContext context, String label) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: FlutterFlowTheme.of(context).primaryBackground,
        width: 2.0,
      ),
    );
    final focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: FlutterFlowTheme.of(context).primary,
        width: 2.0,
      ),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: FlutterFlowTheme.of(context).error,
        width: 2.0,
      ),
    );
    return InputDecoration(
      labelText: label,
      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
            font: GoogleFonts.inter(
              fontWeight:
                  FlutterFlowTheme.of(context).labelMedium.fontWeight,
              fontStyle:
                  FlutterFlowTheme.of(context).labelMedium.fontStyle,
            ),
            letterSpacing: 0.0,
          ),
      enabledBorder: border,
      focusedBorder: focusBorder,
      errorBorder: errorBorder,
      focusedErrorBorder: errorBorder,
      filled: true,
      fillColor: FlutterFlowTheme.of(context).primaryBackground,
    );
  }

  TextStyle _bodyStyle(BuildContext context) {
    return FlutterFlowTheme.of(context).bodyMedium.override(
          font: GoogleFonts.inter(
            fontWeight:
                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
            fontStyle:
                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
          ),
          letterSpacing: 0.0,
        );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF2370B6),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color:
                        FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  // ── ÚNICO SingleChildScrollView que envuelve todo ──
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // ── Encabezado ──────────────────────────────
                        Container(
                          width: double.infinity,
                          height: 76.47,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0),
                            ),
                          ),
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                32.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Mi Seguridad UAMX',
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(
                                              context)
                                          .displaySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(
                                              context)
                                          .displaySmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),

                        // ── Título ──────────────────────────────────
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Text(
                            'Crea una nueva cuenta',
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(
                                            context)
                                        .displaySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(
                                            context)
                                        .displaySmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),

                        // ── Formulario ──────────────────────────────
                        Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ── Nombre ──
                              Padding(
                                padding: const EdgeInsetsDirectional
                                    .fromSTEB(0.0, 0.0, 0.0, 16.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller:
                                        _model.nombreTextController,
                                    focusNode: _model.nombreFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: _inputDeco(
                                        context, 'Nombre completo'),
                                    style: _bodyStyle(context),
                                    keyboardType: TextInputType.name,
                                    validator: _model
                                        .nombreTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),

                              // ── Email ──
                              Padding(
                                padding: const EdgeInsetsDirectional
                                    .fromSTEB(0.0, 0.0, 0.0, 16.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model
                                        .emailAddressTextController,
                                    focusNode:
                                        _model.emailAddressFocusNode,
                                    autofocus: false,
                                    autofillHints: const [
                                      AutofillHints.email
                                    ],
                                    obscureText: false,
                                    decoration:
                                        _inputDeco(context, 'Email'),
                                    style: _bodyStyle(context),
                                    keyboardType:
                                        TextInputType.emailAddress,
                                    validator: _model
                                        .emailAddressTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),

                              // ── Teléfono ──
                              Padding(
                                padding: const EdgeInsetsDirectional
                                    .fromSTEB(0.0, 0.0, 0.0, 16.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller:
                                        _model.telefonoTextController,
                                    focusNode: _model.telefonoFocusNode,
                                    autofocus: false,
                                    autofillHints: const [
                                      AutofillHints.telephoneNumber
                                    ],
                                    obscureText: false,
                                    decoration:
                                        _inputDeco(context, 'Teléfono'),
                                    style: _bodyStyle(context),
                                    keyboardType: TextInputType.phone,
                                    validator: _model
                                        .telefonoTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),

                              // ── Contraseña ──
                              Padding(
                                padding: const EdgeInsetsDirectional
                                    .fromSTEB(0.0, 0.0, 0.0, 16.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller:
                                        _model.contrasenaTextController,
                                    focusNode:
                                        _model.contrasenaFocusNode,
                                    autofocus: false,
                                    autofillHints: const [
                                      AutofillHints.password
                                    ],
                                    obscureText:
                                        !_model.contrasenaVisibility,
                                    decoration: _inputDeco(
                                            context, 'Contraseña')
                                        .copyWith(
                                      suffixIcon: InkWell(
                                        onTap: () async {
                                          safeSetState(() => _model
                                                  .contrasenaVisibility =
                                              !_model
                                                  .contrasenaVisibility);
                                        },
                                        focusNode: FocusNode(
                                            skipTraversal: true),
                                        child: Icon(
                                          _model.contrasenaVisibility
                                              ? Icons.visibility_outlined
                                              : Icons
                                                  .visibility_off_outlined,
                                          color:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                    style: _bodyStyle(context),
                                    validator: _model
                                        .contrasenaTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),

                              // ── Confirmar Contraseña ──
                              Padding(
                                padding: const EdgeInsetsDirectional
                                    .fromSTEB(0.0, 0.0, 0.0, 16.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model
                                        .contrasenaconfirmTextController,
                                    focusNode:
                                        _model.contrasenaconfirmFocusNode,
                                    autofocus: false,
                                    autofillHints: const [
                                      AutofillHints.password
                                    ],
                                    obscureText: !_model
                                        .contrasenaconfirmVisibility,
                                    decoration: _inputDeco(context,
                                            'Confirmar contraseña')
                                        .copyWith(
                                      suffixIcon: InkWell(
                                        onTap: () async {
                                          safeSetState(() => _model
                                                  .contrasenaconfirmVisibility =
                                              !_model
                                                  .contrasenaconfirmVisibility);
                                        },
                                        focusNode: FocusNode(
                                            skipTraversal: true),
                                        child: Icon(
                                          _model
                                                  .contrasenaconfirmVisibility
                                              ? Icons.visibility_outlined
                                              : Icons
                                                  .visibility_off_outlined,
                                          color:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                    style: _bodyStyle(context),
                                    minLines: 1,
                                    validator: _model
                                        .contrasenaconfirmTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),

                              // ── Separador de sección datos médicos ──
                              Padding(
                                padding: const EdgeInsetsDirectional
                                    .fromSTEB(0.0, 8.0, 0.0, 16.0),
                                child: Text(
                                  'Datos médicos (opcionales)',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),

                              // ── Teléfono de emergencia ──
                              Padding(
                                padding: const EdgeInsetsDirectional
                                    .fromSTEB(0.0, 0.0, 0.0, 16.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model
                                        .telefonoEmergenciaTextController,
                                    focusNode:
                                        _model.telefonoEmergenciaFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: _inputDeco(
                                        context, 'Teléfono de emergencia'),
                                    style: _bodyStyle(context),
                                    keyboardType: TextInputType.phone,
                                    validator: _model
                                        .telefonoEmergenciaTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),

                              // ── Tipo de sangre ──
                              Padding(
                                padding: const EdgeInsetsDirectional
                                    .fromSTEB(0.0, 0.0, 0.0, 16.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller:
                                        _model.tipodesangreTextController,
                                    focusNode:
                                        _model.tipodesangreFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: _inputDeco(
                                        context, 'Tipo de sangre'),
                                    style: _bodyStyle(context),
                                    validator: _model
                                        .tipodesangreTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),

                              // ── Alergias ──
                              Padding(
                                padding: const EdgeInsetsDirectional
                                    .fromSTEB(0.0, 0.0, 0.0, 16.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller:
                                        _model.alergiasTextController1,
                                    focusNode: _model.alergiasFocusNode1,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration:
                                        _inputDeco(context, 'Alergias'),
                                    style: _bodyStyle(context),
                                    maxLines: 2,
                                    minLines: 1,
                                    validator: _model
                                        .alergiasTextController1Validator
                                        .asValidator(context),
                                  ),
                                ),
                              ),

                              // ── Medicamentos ──
                              Padding(
                                padding: const EdgeInsetsDirectional
                                    .fromSTEB(0.0, 0.0, 0.0, 16.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller:
                                        _model.medicamentosTextController,
                                    focusNode:
                                        _model.medicamentosFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: _inputDeco(
                                        context, 'Medicamentos'),
                                    style: _bodyStyle(context),
                                    maxLines: 2,
                                    minLines: 1,
                                    validator: _model
                                        .medicamentosTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),

                              // ── Padecimientos ──
                              Padding(
                                padding: const EdgeInsetsDirectional
                                    .fromSTEB(0.0, 0.0, 0.0, 16.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model
                                        .padecimientosTextController,
                                    focusNode:
                                        _model.padecimientosFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: _inputDeco(
                                        context, 'Padecimientos'),
                                    style: _bodyStyle(context),
                                    maxLines: 2,
                                    minLines: 1,
                                    validator: _model
                                        .padecimientosTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),

                              // ── Botón Registrarme ──
                              Padding(
                                padding: const EdgeInsetsDirectional
                                    .fromSTEB(0.0, 8.0, 0.0, 16.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    GoRouter.of(context).prepareAuthEvent();
                                    if (_model.contrasenaTextController
                                            .text !=
                                        _model
                                            .contrasenaconfirmTextController
                                            .text) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              '¡Las contraseñas no coinciden!'),
                                        ),
                                      );
                                      return;
                                    }

                                    final user = await authManager
                                        .createAccountWithEmail(
                                      context,
                                      _model.emailAddressTextController.text,
                                      _model.contrasenaTextController.text,
                                    );
                                    if (user == null) {
                                      return;
                                    }

                                    // Guardar TODOS los campos en Firestore
                                    await UsersRecord.collection
                                        .doc(user.uid)
                                        .update(createUsersRecordData(
                                          displayName: _model
                                              .nombreTextController.text,
                                          phoneNumber: _model
                                              .telefonoTextController.text,
                                          contactoEmergenciaTelefono: _model
                                              .telefonoEmergenciaTextController
                                              .text,
                                          tipoSangre: _model
                                              .tipodesangreTextController.text,
                                          alergias: _model
                                              .alergiasTextController1.text,
                                          medicamentos: _model
                                              .medicamentosTextController.text,
                                          padecimientos: _model
                                              .padecimientosTextController.text,
                                        ));

                                    context.goNamedAuth(
                                        HomePageWidget.routeName,
                                        context.mounted);
                                  },
                                  text: 'Registrarme',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 56.0,
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                    iconPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF2370B6),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.interTight(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),

                              // ── Link "¿Ya tienes cuenta?" ──
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 24.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context
                                        .pushNamed(LogInWidget.routeName);
                                  },
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: '¿Ya tienes cuenta? ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Ingresa aquí',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
