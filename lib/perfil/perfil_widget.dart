import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'perfil_model.dart';
export 'perfil_model.dart';

class PerfilWidget extends StatefulWidget {
  const PerfilWidget({super.key});

  static String routeName = 'Perfil';
  static String routePath = '/perfil';

  @override
  State<PerfilWidget> createState() => _PerfilWidgetState();
}

class _PerfilWidgetState extends State<PerfilWidget> {
  late PerfilModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool _editando = false;
  bool _guardando = false;

  late TextEditingController _nombreCtrl;
  late TextEditingController _telefonoCtrl;
  late TextEditingController _emergenciaCtrl;
  late TextEditingController _tipoSangreCtrl;
  late TextEditingController _alergiasCtrl;
  late TextEditingController _padecimientosCtrl;
  late TextEditingController _medicamentosCtrl;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerfilModel());
    _nombreCtrl = TextEditingController();
    _telefonoCtrl = TextEditingController();
    _emergenciaCtrl = TextEditingController();
    _tipoSangreCtrl = TextEditingController();
    _alergiasCtrl = TextEditingController();
    _padecimientosCtrl = TextEditingController();
    _medicamentosCtrl = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _nombreCtrl.dispose();
    _telefonoCtrl.dispose();
    _emergenciaCtrl.dispose();
    _tipoSangreCtrl.dispose();
    _alergiasCtrl.dispose();
    _padecimientosCtrl.dispose();
    _medicamentosCtrl.dispose();
    _model.dispose();
    super.dispose();
  }

  void _rellenarFormularioDesdeDocumento() {
    final d = currentUserDocument;
    final authUser = FirebaseAuth.instance.currentUser;
    _nombreCtrl.text = (d?.displayName.isNotEmpty ?? false)
        ? d!.displayName
        : (authUser?.displayName ?? '');
    _telefonoCtrl.text = d?.phoneNumber ?? authUser?.phoneNumber ?? '';
    _emergenciaCtrl.text = d?.contactoEmergenciaTelefono ?? '';
    _tipoSangreCtrl.text = d?.tipoSangre ?? '';
    _alergiasCtrl.text = d?.alergias ?? '';
    _padecimientosCtrl.text = d?.padecimientos ?? '';
    _medicamentosCtrl.text = d?.medicamentos ?? '';
  }

  Future<void> _guardarCambios() async {
    if (!loggedIn) return;
    setState(() => _guardando = true);
    try {
      await updateUserDocument(
        displayName: _nombreCtrl.text.trim(),
        phoneNumber: _telefonoCtrl.text.trim(),
        contactoEmergenciaTelefono: _emergenciaCtrl.text.trim(),
        tipoSangre: _tipoSangreCtrl.text.trim(),
        alergias: _alergiasCtrl.text.trim(),
        padecimientos: _padecimientosCtrl.text.trim(),
        medicamentos: _medicamentosCtrl.text.trim(),
      );
      final nombre = _nombreCtrl.text.trim();
      final user = FirebaseAuth.instance.currentUser;
      if (user != null && nombre.isNotEmpty) {
        await user.updateDisplayName(nombre);
      }
      if (mounted) {
        setState(() {
          _editando = false;
          _guardando = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Datos guardados correctamente.'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (_) {
      if (mounted) {
        setState(() => _guardando = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
                'No se pudieron guardar los datos. Verifique su conexión o permisos en Firestore.'),
            backgroundColor: Colors.red.shade700,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  Future<void> _llamarTelefono(String raw) async {
    final digits = raw.replaceAll(RegExp(r'\D'), '');
    if (digits.isEmpty) return;
    final uri = Uri(scheme: 'tel', path: digits);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  InputDecoration _inputDecoration(BuildContext context, String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: const Color(0xFFF5F5F5),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    );
  }

  Widget _etiqueta(String texto) {
    return Text(
      texto,
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            font: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontStyle:
                  FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
            letterSpacing: 0.0,
          ),
    );
  }

  Widget _filaLectura({
    required String etiqueta,
    required String valor,
    VoidCallback? onValorTap,
  }) {
    final textoValor =
        valor.isEmpty ? '—' : valor;
    final valorWidget = onValorTap != null && valor.isNotEmpty
        ? InkWell(
            onTap: onValorTap,
            child: Text(
              textoValor,
              textAlign: TextAlign.end,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primary,
                    letterSpacing: 0.0,
                  ),
            ),
          )
        : Text(
            textoValor,
            textAlign: TextAlign.end,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  letterSpacing: 0.0,
                ),
          );

    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: _etiqueta(etiqueta)),
          Expanded(
            flex: 3,
            child: valorWidget,
          ),
        ],
      ),
    );
  }

  Widget _campoEdicion({
    required String etiqueta,
    required TextEditingController controller,
    String hint = '',
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 6),
            child: _etiqueta(etiqueta),
          ),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: _inputDecoration(
              context,
              hint.isEmpty ? etiqueta : hint,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      builder: (context) {
        if (!loggedIn) {
          return Scaffold(
            backgroundColor: const Color(0xFF2370B6),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Debe iniciar sesión para ver su perfil.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () =>
                          context.goNamed(LogInWidget.routeName),
                      child: const Text('Ir al inicio de sesión'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (currentUserDocument == null) {
          return Scaffold(
            backgroundColor: const Color(0xFF2370B6),
            body: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final doc = currentUserDocument!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFF2370B6),
            appBar: AppBar(
              backgroundColor: const Color(0xFF2370B6),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                fillColor: const Color(0xFF2370B6),
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).info,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Mi perfil',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineLarge
                            .fontStyle,
                      ),
                      color: Colors.white,
                      fontSize: 23.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              actions: [
                if (!_editando)
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: const Color(0xFF2370B6),
                    icon: Icon(
                      Icons.edit_outlined,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () {
                      _rellenarFormularioDesdeDocumento();
                      setState(() => _editando = true);
                    },
                  ),
                Align(
                  alignment: const AlignmentDirectional(1.0, 1.01),
                  child: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: const Color(0xFF2370B6),
                    icon: Icon(
                      Icons.logout,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      if (!context.mounted) return;
                      GoRouter.of(context).clearRedirectLocation();
                      context.goNamedAuth(
                          LogInWidget.routeName, context.mounted);
                    },
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 1.0,
            ),
            body: Align(
              alignment: AlignmentDirectional.center,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 140.0,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(
                                top: 12.0),
                            child: Container(
                              width: 90.0,
                              height: 90.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.person,
                                size: 48,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 16.0, bottom: 12.0),
                    child: Text(
                      currentUserDisplayName.isNotEmpty
                          ? currentUserDisplayName
                          : 'Usuario',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).info,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Text(
                    currentUserEmail,
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).accent4,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 4),
                    child: Text(
                      'El correo se gestiona desde la cuenta de Firebase; no se edita aquí.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: Colors.white.withValues(alpha: 0.85),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Color(0xFFE5F0FF),
                            offset: Offset(0.0, -1.0),
                          )
                        ],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(
                              thickness: 50.0,
                              color: Color(0xFF2370B6),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Datos del usuario',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          font: GoogleFonts.interTight(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  const SizedBox(height: 16),
                                  if (_editando) ...[
                                    _campoEdicion(
                                      etiqueta: 'Nombre completo',
                                      controller: _nombreCtrl,
                                      hint: 'Su nombre',
                                    ),
                                    _campoEdicion(
                                      etiqueta: 'Teléfono',
                                      controller: _telefonoCtrl,
                                      hint: '10 dígitos',
                                      keyboardType: TextInputType.phone,
                                    ),
                                    _campoEdicion(
                                      etiqueta: 'Contacto de emergencia',
                                      controller: _emergenciaCtrl,
                                      hint: 'Teléfono de un familiar o contacto',
                                      keyboardType: TextInputType.phone,
                                    ),
                                    _campoEdicion(
                                      etiqueta: 'Tipo de sangre',
                                      controller: _tipoSangreCtrl,
                                      hint: 'Ej. O+, A−',
                                    ),
                                    _campoEdicion(
                                      etiqueta: 'Alergias',
                                      controller: _alergiasCtrl,
                                      hint: 'Separe con comas si hay varias',
                                    ),
                                    _campoEdicion(
                                      etiqueta: 'Padecimientos',
                                      controller: _padecimientosCtrl,
                                    ),
                                    _campoEdicion(
                                      etiqueta: 'Medicamentos',
                                      controller: _medicamentosCtrl,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: OutlinedButton(
                                            onPressed: _guardando
                                                ? null
                                                : () {
                                                    _rellenarFormularioDesdeDocumento();
                                                    setState(() =>
                                                        _editando = false);
                                                  },
                                            child: const Text('Cancelar'),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: FilledButton(
                                            onPressed: _guardando
                                                ? null
                                                : _guardarCambios,
                                            style: FilledButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xFF2370B6),
                                            ),
                                            child: _guardando
                                                ? const SizedBox(
                                                    height: 22,
                                                    width: 22,
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                : const Text('Guardar'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ] else ...[
                                    _filaLectura(
                                      etiqueta: 'Teléfono',
                                      valor: doc.phoneNumber,
                                      onValorTap: doc.phoneNumber.isNotEmpty
                                          ? () =>
                                              _llamarTelefono(doc.phoneNumber)
                                          : null,
                                    ),
                                    _filaLectura(
                                      etiqueta: 'Contacto de emergencia',
                                      valor: doc.contactoEmergenciaTelefono,
                                      onValorTap: doc
                                              .contactoEmergenciaTelefono
                                              .isNotEmpty
                                          ? () => _llamarTelefono(doc
                                              .contactoEmergenciaTelefono)
                                          : null,
                                    ),
                                    _filaLectura(
                                      etiqueta: 'Tipo de Sangre',
                                      valor: doc.tipoSangre,
                                    ),
                                    _filaLectura(
                                      etiqueta: 'Alergias',
                                      valor: doc.alergias,
                                    ),
                                    _filaLectura(
                                      etiqueta: 'Padecimientos',
                                      valor: doc.padecimientos,
                                    ),
                                    _filaLectura(
                                      etiqueta: 'Medicamentos',
                                      valor: doc.medicamentos,
                                    ),
                                  ],
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
      },
    );
  }
}
