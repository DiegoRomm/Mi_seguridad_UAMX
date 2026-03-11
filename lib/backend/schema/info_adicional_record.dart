import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InfoAdicionalRecord extends FirestoreRecord {
  InfoAdicionalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Genero" field.
  String? _genero;
  String get genero => _genero ?? '';
  bool hasGenero() => _genero != null;

  // "tipo_sangre" field.
  String? _tipoSangre;
  String get tipoSangre => _tipoSangre ?? '';
  bool hasTipoSangre() => _tipoSangre != null;

  // "contacto_emergencia" field.
  String? _contactoEmergencia;
  String get contactoEmergencia => _contactoEmergencia ?? '';
  bool hasContactoEmergencia() => _contactoEmergencia != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _genero = snapshotData['Genero'] as String?;
    _tipoSangre = snapshotData['tipo_sangre'] as String?;
    _contactoEmergencia = snapshotData['contacto_emergencia'] as String?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('info_Adicional');

  static Stream<InfoAdicionalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InfoAdicionalRecord.fromSnapshot(s));

  static Future<InfoAdicionalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InfoAdicionalRecord.fromSnapshot(s));

  static InfoAdicionalRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InfoAdicionalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InfoAdicionalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InfoAdicionalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InfoAdicionalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InfoAdicionalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInfoAdicionalRecordData({
  String? genero,
  String? tipoSangre,
  String? contactoEmergencia,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Genero': genero,
      'tipo_sangre': tipoSangre,
      'contacto_emergencia': contactoEmergencia,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class InfoAdicionalRecordDocumentEquality
    implements Equality<InfoAdicionalRecord> {
  const InfoAdicionalRecordDocumentEquality();

  @override
  bool equals(InfoAdicionalRecord? e1, InfoAdicionalRecord? e2) {
    return e1?.genero == e2?.genero &&
        e1?.tipoSangre == e2?.tipoSangre &&
        e1?.contactoEmergencia == e2?.contactoEmergencia &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(InfoAdicionalRecord? e) => const ListEquality()
      .hash([e?.genero, e?.tipoSangre, e?.contactoEmergencia, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is InfoAdicionalRecord;
}
