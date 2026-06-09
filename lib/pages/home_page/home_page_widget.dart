import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:io';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<bool> _tieneConexion() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  void _mostrarAlertaSinConexion(BuildContext ctx) {
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.wifi_off_rounded, color: Color(0xFFD32F2F), size: 28),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Sin conexión a Internet',
                style: GoogleFonts.inter(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
          ],
        ),
        content: Text(
          'Para el correcto funcionamiento de esta aplicación es indispensable contar con una conexión a Internet activa. '
          'Algunas funciones, como el envío de alertas de emergencia y la visualización de mapas, '
          'requieren conectividad de red.\n\n'
          'Por favor, verifique su conexión Wi-Fi o datos móviles antes de continuar.',
          style: GoogleFonts.inter(fontSize: 14, color: Color(0xFF444444), height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              final conectado = await _tieneConexion();
              if (!conectado && mounted) {
                _mostrarAlertaSinConexion(context);
              }
            },
            child: Text(
              'Reintentar',
              style: GoogleFonts.inter(
                  color: Color(0xFF2370B6), fontWeight: FontWeight.w600),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF2370B6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(
              'Continuar de todos modos',
              style: GoogleFonts.inter(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {});
      final conectado = await _tieneConexion();
      if (!conectado && mounted) {
        _mostrarAlertaSinConexion(context);
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Widget _buildIconButton({
    required BuildContext context,
    required double containerSize,
    required double imageSize,
    required String assetPath,
    required String label,
    required BoxFit imageFit,
    required VoidCallback onTap,
  }) {
    return Container(
      width: containerSize,
      height: containerSize + 24,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: onTap,
            child: Container(
              width: imageSize,
              height: imageSize,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(assetPath, fit: imageFit),
            ),
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccessButton({
    required BuildContext context,
    required double imageSize,
    required String assetPath,
    required String label,
    required BoxFit imageFit,
    required VoidCallback onTap,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: Container(
            width: imageSize,
            height: imageSize,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image.asset(assetPath, fit: imageFit),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.inter(
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                fontSize: 11.0,
                letterSpacing: 0.0,
              ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final shortestSide = mediaQuery.size.shortestSide;

    final iconContainerSize = (shortestSide * 0.22).clamp(85.0, 115.0);
    final iconImageSize = iconContainerSize * 0.72;
    final sosButtonSize = (shortestSide * 0.45).clamp(160.0, 220.0);
    final horizontalPadding = (screenWidth * 0.04).clamp(12.0, 24.0);
    final verticalPadding = (screenHeight * 0.015).clamp(8.0, 16.0);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF5F7FA),
        appBar: AppBar(
          backgroundColor: const Color(0xFF2370B6),
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: const AlignmentDirectional(0.47, -1.02),
            child: FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 48.0,
              fillColor: const Color(0xFF2370B6),
              icon: Icon(
                Icons.person,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed(PerfilWidget.routeName);
              },
            ),
          ),
          actions: const [],
          flexibleSpace: FlexibleSpaceBar(
            title: Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Text(
                'Mi seguridad UAMX',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FontWeight.bold,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineLarge
                            .fontStyle,
                      ),
                      color: const Color(0xFFFFFCFC),
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                    ),
              ),
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 5.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ── SOS Button ──────────────────────────────────────────
                Padding(
                  padding: EdgeInsets.symmetric(vertical: verticalPadding),
                  child: Column(
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await actions.getlocation();
                          try {
                            await actions.sendWhatsappLocation();
                          } catch (_) {}
                          context.pushNamed(MapaUbicacionPageWidget.routeName);
                        },
                        child: Container(
                          width: sosButtonSize,
                          height: sosButtonSize,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/SOS1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Presiona para enviar alerta',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),

                // ── Accesos Principales ──────────────────────────────────
                Padding(
                  padding: EdgeInsets.only(
                      top: verticalPadding, bottom: verticalPadding * 0.5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Accesos Principales',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 18.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 6.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: verticalPadding,
                      horizontal: horizontalPadding * 0.5,
                    ),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      alignment: WrapAlignment.spaceEvenly,
                      children: [
                        _buildIconButton(
                          context: context,
                          containerSize: iconContainerSize,
                          imageSize: iconImageSize,
                          assetPath: 'assets/images/proteccion_civil.png',
                          label: 'Protección Civil',
                          imageFit: BoxFit.cover,
                          onTap: () => context
                              .pushNamed(ProteccionCivilWidget.routeName),
                        ),
                        _buildIconButton(
                          context: context,
                          containerSize: iconContainerSize,
                          imageSize: iconImageSize,
                          assetPath: 'assets/images/servicios_medicos.png',
                          label: 'Servicios Médicos',
                          imageFit: BoxFit.cover,
                          onTap: () => context
                              .pushNamed(ServiciosMedicosWidget.routeName),
                        ),
                        _buildIconButton(
                          context: context,
                          containerSize: iconContainerSize,
                          imageSize: iconImageSize,
                          assetPath: 'assets/images/upavig.png',
                          label: 'UPAVIG',
                          imageFit: BoxFit.contain,
                          onTap: () =>
                              context.pushNamed(UpavigWidget.routeName),
                        ),
                        _buildIconButton(
                          context: context,
                          containerSize: iconContainerSize,
                          imageSize: iconImageSize,
                          assetPath: 'assets/images/logoPROPESA.png',
                          label: 'PROPRESA',
                          imageFit: BoxFit.cover,
                          onTap: () => context
                              .pushNamed(PrevenciondesaludWidget.routeName),
                        ),
                      ],
                    ),
                  ),
                ),

                // ── Mapa del campus ───────────────────────────────────────
                Padding(
                  padding: EdgeInsets.only(
                      top: verticalPadding * 1.5,
                      bottom: verticalPadding * 0.5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Mapa del campus',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 18.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 6.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: verticalPadding,
                      horizontal: horizontalPadding * 0.5,
                    ),
                    child: Center(
                      child: _buildQuickAccessButton(
                        context: context,
                        imageSize: iconImageSize,
                        assetPath: 'assets/images/mapa_download.png',
                        label: 'Mapa de botones de pánico',
                        imageFit: BoxFit.cover,
                        onTap: () =>
                            context.pushNamed(MapaBotonesWidget.routeName),
                      ),
                    ),
                  ),
                ),

                // ── Logo UAM ─────────────────────────────────────────────
                Padding(
                  padding: EdgeInsets.symmetric(vertical: verticalPadding),
                  child: Container(
                    width: double.infinity,
                    height: (screenHeight * 0.10).clamp(70.0, 110.0),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/variacion5Xoc.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
