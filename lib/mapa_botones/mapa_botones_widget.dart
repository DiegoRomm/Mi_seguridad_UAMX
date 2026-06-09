import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmap;
import 'package:provider/provider.dart';
import 'mapa_botones_model.dart';
export 'mapa_botones_model.dart';

// ─── Modelo de cada botón de pánico ────────────────────────────────────────
class _BotonPanico {
  const _BotonPanico({
    required this.id,
    required this.nombre,
    required this.posicion,
    this.descripcion = '',
  });

  final String id;
  final String nombre;
  final gmap.LatLng posicion;
  final String descripcion;
}

// ─── Lista de botones de pánico — agrega o edita aquí las coordenadas ───────
const List<_BotonPanico> _botonesPanico = [
  _BotonPanico(
    id: 'bp_01',
    nombre: 'BP Edificio N',
    posicion: gmap.LatLng(19.300392, -99.103241),
  ),
  _BotonPanico(
    id: 'bp_02',
    nombre: 'BP Edificio R',
    posicion: gmap.LatLng(19.301182, -99.103294),
  ),
  _BotonPanico(
    id: 'bp_03',
    nombre: 'BP Edificio S',
    posicion: gmap.LatLng(19.301020, -99.102867),
  ),
  _BotonPanico(
    id: 'bp_04',
    nombre: 'BP Kiosko',
    posicion: gmap.LatLng(19.303078, -99.103340),
  ),
  _BotonPanico(
    id: 'bp_05',
    nombre: 'BP Edificio L',
    posicion: gmap.LatLng(19.302187, -99.102211),
  ),
  _BotonPanico(
    id: 'bp_06',
    nombre: 'BP Caseta 8',
    posicion: gmap.LatLng(19.302626, -99.102669),
  ),
  _BotonPanico(
    id: 'bp_07',
    nombre: 'BP Edificio I',
    posicion: gmap.LatLng(19.303097, -99.102676),
  ),
  _BotonPanico(
    id: 'bp_08',
    nombre: 'BP Edificio K',
    posicion: gmap.LatLng(19.303232, -99.102173),
  ),
  _BotonPanico(
    id: 'bp_09',
    nombre: 'BP Biblioteca y Cafetería',
    posicion: gmap.LatLng(19.305056, -99.101845),
  ),
  _BotonPanico(
    id: 'bp_10',
    nombre: 'BP Biblioteca',
    posicion: gmap.LatLng(19.305960, -99.101776),
  ),
  _BotonPanico(
    id: 'bp_11',
    nombre: 'BP Caseta 10',
    posicion: gmap.LatLng(19.306692, -99.101730),
  ),
  _BotonPanico(
    id: 'bp_12',
    nombre: 'BP Velaria',
    posicion: gmap.LatLng(19.305969, -99.102592),
  ),
  _BotonPanico(
    id: 'bp_13',
    nombre: 'BP Actividades',
    posicion: gmap.LatLng(19.306725, -99.103600),
  ),
  _BotonPanico(
    id: 'bp_14',
    nombre: 'BP Canchas',
    posicion: gmap.LatLng(19.305882, -99.103554),
  ),
  _BotonPanico(
    id: 'bp_15',
    nombre: 'BP Zapata',
    posicion: gmap.LatLng(19.304977, -99.103226),
  ),
  _BotonPanico(
    id: 'bp_16',
    nombre: 'BP Cafetería',
    posicion: gmap.LatLng(19.304590, -99.102592),
  ),
  _BotonPanico(
    id: 'bp_17',
    nombre: 'BP Edén',
    posicion: gmap.LatLng(19.303408, -99.103172),
  ),
];

// Posición inicial de la cámara — centro del campus (abarca todos los pines)
const _camaraInicial = gmap.CameraPosition(
  target: gmap.LatLng(19.303700, -99.102700),
  zoom: 15.8,
);

class MapaBotonesWidget extends StatefulWidget {
  const MapaBotonesWidget({super.key});

  static String routeName = 'Mapa_botones';
  static String routePath = '/mapaBotones';

  @override
  State<MapaBotonesWidget> createState() => _MapaBotonesWidgetState();
}

class _MapaBotonesWidgetState extends State<MapaBotonesWidget> {
  late MapaBotonesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  gmap.GoogleMapController? _mapController;
  final Set<gmap.Marker> _marcadores = {};
  String? _pinSeleccionado;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapaBotonesModel());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _construirMarcadores();
    });
  }

  @override
  void dispose() {
    _mapController?.dispose();
    _model.dispose();
    super.dispose();
  }

  void _construirMarcadores() {
    final Set<gmap.Marker> nuevos = {};
    for (final boton in _botonesPanico) {
      nuevos.add(
        gmap.Marker(
          markerId: gmap.MarkerId(boton.id),
          position: boton.posicion,
          icon: gmap.BitmapDescriptor.defaultMarkerWithHue(
            gmap.BitmapDescriptor.hueRed,
          ),
          infoWindow: gmap.InfoWindow(
            title: boton.nombre,
            snippet: boton.descripcion.isNotEmpty ? boton.descripcion : null,
          ),
          onTap: () {
            setState(() => _pinSeleccionado = boton.id);
            _mapController?.animateCamera(
              gmap.CameraUpdate.newLatLngZoom(boton.posicion, 18.5),
            );
          },
        ),
      );
    }
    if (mounted) setState(() => _marcadores.addAll(nuevos));
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
        backgroundColor: const Color(0xFFF5F7FA),
        appBar: AppBar(
          backgroundColor: const Color(0xFF2370B6),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            fillColor: const Color(0xFF2370B6),
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Mapa de botones de pánico',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FlutterFlowTheme.of(context)
                        .headlineMedium
                        .fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 40.0,
              fillColor: const Color(0xFF2370B6),
              icon: Icon(
                Icons.my_location,
                color: FlutterFlowTheme.of(context).info,
                size: 22.0,
              ),
              onPressed: () {
                _mapController?.animateCamera(
                  gmap.CameraUpdate.newCameraPosition(_camaraInicial),
                );
              },
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Stack(
          children: [
            // ── Mapa ──────────────────────────────────────────────────────
            gmap.GoogleMap(
              initialCameraPosition: _camaraInicial,
              markers: _marcadores,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: true,
              mapToolbarEnabled: false,
              onMapCreated: (controller) {
                _mapController = controller;
              },
              onTap: (_) {
                setState(() => _pinSeleccionado = null);
              },
            ),

            // ── Panel inferior con lista scrollable ──────────────────────
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.35,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 12,
                      offset: const Offset(0, -3),
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 14, 20, 8),
                      child: Row(
                        children: [
                          Text(
                            'Botones de pánico en campus',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF1A1A1A),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${_botonesPanico.length} ubicaciones',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: const Color(0xFF888888),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                        itemCount: _botonesPanico.length,
                        itemBuilder: (context, index) {
                          final b = _botonesPanico[index];
                          return _LeyendaItem(
                            nombre: b.nombre,
                            descripcion: b.descripcion,
                            seleccionado: _pinSeleccionado == b.id,
                            onTap: () {
                              setState(() => _pinSeleccionado = b.id);
                              _mapController?.animateCamera(
                                gmap.CameraUpdate.newLatLngZoom(
                                    b.posicion, 18.5),
                              );
                              _mapController?.showMarkerInfoWindow(
                                  gmap.MarkerId(b.id));
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                      child: Row(
                        children: [
                          const Icon(Icons.info_outline,
                              size: 13, color: Color(0xFF888888)),
                          const SizedBox(width: 4),
                          Text(
                            'Toca un pin o elemento de la lista para centrar',
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              color: const Color(0xFF888888),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Widget auxiliar para cada fila de la leyenda ──────────────────────────
class _LeyendaItem extends StatelessWidget {
  const _LeyendaItem({
    required this.nombre,
    required this.descripcion,
    required this.seleccionado,
    required this.onTap,
  });

  final String nombre;
  final String descripcion;
  final bool seleccionado;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: seleccionado
              ? const Color(0xFF2370B6).withOpacity(0.1)
              : Colors.grey.withOpacity(0.06),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: seleccionado
                ? const Color(0xFF2370B6)
                : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.location_on, color: Color(0xFFD32F2F), size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombre,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                  if (descripcion.isNotEmpty)
                    Text(
                      descripcion,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: const Color(0xFF666666),
                      ),
                    ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right,
                color: Color(0xFF2370B6), size: 18),
          ],
        ),
      ),
    );
  }
}
