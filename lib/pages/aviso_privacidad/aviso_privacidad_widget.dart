import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AvisoPrivacidadWidget extends StatefulWidget {
  const AvisoPrivacidadWidget({super.key});

  static String routeName = 'AvisoPrivacidad';
  static String routePath = '/avisoPrivacidad';

  @override
  State<AvisoPrivacidadWidget> createState() => _AvisoPrivacidadWidgetState();
}

class _AvisoPrivacidadWidgetState extends State<AvisoPrivacidadWidget> {
  bool _aceptado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: const Color(0xFF2370B6),
        elevation: 5.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Aviso de Privacidad',
          style: GoogleFonts.interTight(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'AVISO DE PRIVACIDAD INTEGRAL',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.interTight(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2370B6),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Center(
                      child: Text(
                        'USO DE APLICACIÓN "MI SEGURIDAD UAMX"\nSECRETARIA DE UNIDAD XOCHIMILCO',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2370B6),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    _buildSection(
                      'Domicilio del responsable',
                      'La Universidad Autónoma Metropolitana, con domicilio en Prolongación Canal de Miramontes 3855, Colonia Rancho Los Colorines, C.P. 14386, Alcaldía Tlalpan, Ciudad de México, a través de la Secretaría de la Unidad Xochimilco, con domicilio en Calzada del Hueso 1100, Colonia Villa Quietud, Alcaldía Coyoacán, C.P. 04960, Ciudad de México, recaban sus datos personales, y son responsables de su tratamiento, conforme a lo dispuesto por la Ley General de Protección de Datos Personales en Posesión de Sujetos Obligados y el Reglamento para la Transparencia de la Información y la Protección de Datos Personales.',
                    ),
                    _buildSection(
                      'Datos personales que serán recabados',
                      'Para llevar a cabo las finalidades descritas en el presente aviso de privacidad y para tu registro en la aplicación Mi Seguridad UAMX, se solicitarán los siguientes datos personales:',
                    ),
                    _buildBullets([
                      'Nombre completo.',
                      'Matrícula o número económico.',
                      'Número de teléfono celular.',
                      'Contacto de emergencia.',
                      'Tipo de sangre, alergias, padecimientos y medicamentos.',
                    ]),
                    _buildBody(
                      'Los datos de salud se consideran datos personales sensibles. En cumplimiento del artículo 15 de la LGPDPPSO, usted deberá otorgar su consentimiento expreso, que en la aplicación Mi Seguridad UAMX se cumple al marcar la casilla de verificación habilitada para dicho efecto.',
                    ),
                    _buildSection(
                      'Finalidades del tratamiento',
                      '',
                    ),
                    _buildBullets([
                      'Identificarte en caso de activación del botón de emergencia.',
                      'Facilitar la atención del servicio médico y de protección civil.',
                      'Notificar a tu contacto de emergencia.',
                      'Brindar atención médica adecuada considerando tu perfil de salud.',
                      'Generar estadísticas institucionales de seguridad (datos anonimizados).',
                    ]),
                    _buildSection(
                      'Derechos ARCO',
                      'Tienes derecho a Acceder, Rectificar, Cancelar u Oponerte al tratamiento de tus datos personales. Para ejercerlos, presenta tu solicitud ante nuestra Unidad de Transparencia:',
                    ),
                    _buildBullets([
                      'Titular: Dr. Diego Daniel Cárdenas de la O.',
                      'Domicilio: Prolongación Canal de Miramontes 3855, Col. Rancho Los Colorines, Alcaldía Tlalpan, CP 14386, CDMX.',
                      'Correo: transparencia@correo.uam.mx',
                      'Teléfono: 55 5483-4000 ext. 1938 y 1898',
                    ]),
                    _buildBody(
                      'También puedes presentar solicitudes a través de la Plataforma Nacional de Transparencia (PNT): www.plataformadetransparencia.org.mx\n\nLa determinación se comunicará en un plazo máximo de veinte días hábiles.',
                    ),
                    _buildSection(
                      'Transferencias de datos personales',
                      'En principio, no se realizarán transferencias de datos personales, salvo en los casos previstos como excepción en los artículos 16, 60 y 64 de la LGPDPPSO, o en situaciones de emergencia médica grave.',
                    ),
                    _buildSection(
                      'Seguridad de la información',
                      'La UAM Xochimilco implementa medidas de seguridad administrativas, técnicas y físicas para proteger tus datos contra daño, pérdida, alteración, destrucción o uso no autorizado.',
                    ),
                    _buildSection(
                      'Términos de uso',
                      'El uso de la aplicación Mi Seguridad UAMX es exclusivo para la comunidad universitaria de la UAM Xochimilco. El botón de emergencia debe activarse únicamente ante situaciones reales de riesgo. El mal uso podrá derivar en sanciones conforme al Reglamento de Alumnos y demás normativa institucional aplicable.',
                    ),
                    _buildSection(
                      'Modificaciones al Aviso de Privacidad',
                      'El presente Aviso puede ser susceptible de modificaciones derivadas de nuevos requerimientos legales. Las actualizaciones estarán disponibles en la aplicación y en: https://datospersonales.uam.mx/ap.html',
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Fecha de elaboración: 16/04/2026\nFecha de última actualización: 16/04/2026',
                      style: GoogleFonts.inter(
                        fontSize: 11.0,
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    // Checkbox de aceptación
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F6FF),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: const Color(0xFF2370B6),
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: _aceptado,
                            activeColor: const Color(0xFF2370B6),
                            onChanged: (value) {
                              setState(() {
                                _aceptado = value ?? false;
                              });
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: RichText(
                                text: TextSpan(
                                  style: GoogleFonts.inter(
                                    fontSize: 13.0,
                                    color: Colors.black87,
                                  ),
                                  children: [
                                    const TextSpan(
                                      text:
                                          'He leído y acepto el ',
                                    ),
                                    TextSpan(
                                      text: 'Aviso de Privacidad Integral',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2370B6),
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {},
                                    ),
                                    const TextSpan(
                                      text:
                                          ' de la UAM Xochimilco y otorgo mi consentimiento expreso para el tratamiento de mis datos personales, incluyendo datos sensibles de salud.',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                  ],
                ),
              ),
            ),
            // Botón de continuar fijo en la parte inferior
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8.0,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: FFButtonWidget(
                onPressed: _aceptado
                    ? () {
                        context.pushNamed(
                          CrearCuentaWidget.routeName,
                          extra: <String, dynamic>{
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                            ),
                          },
                        );
                      }
                    : null,
                text: 'Aceptar y continuar al registro',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
                  color: _aceptado
                      ? const Color(0xFF2370B6)
                      : Colors.grey[400],
                  textStyle: GoogleFonts.interTight(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                  elevation: _aceptado ? 3.0 : 0.0,
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String body) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2370B6),
            ),
          ),
          if (body.isNotEmpty) ...[
            const SizedBox(height: 6.0),
            _buildBody(body),
          ],
        ],
      ),
    );
  }

  Widget _buildBody(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 13.0,
          height: 1.55,
          color: Colors.black87,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildBullets(List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '• ',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Color(0xFF2370B6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item,
                        style: GoogleFonts.inter(
                          fontSize: 13.0,
                          height: 1.5,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
