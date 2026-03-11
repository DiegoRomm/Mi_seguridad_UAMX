import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UbicacionRecord extends FirestoreRecord {
  UbicacionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ubicacion_usuario" field.
  LatLng? _ubicacionUsuario;
  LatLng? get ubicacionUsuario => _ubicacionUsuario;
  bool hasUbicacionUsuario() => _ubicacionUsuario != null;

  // "ubicacion_vigilante" field.
  LatLng? _ubicacionVigilante;
  LatLng? get ubicacionVigilante => _ubicacionVigilante;
  bool hasUbicacionVigilante() => _ubicacionVigilante != null;

  void _initializeFields() {
    _ubicacionUsuario = snapshotData['ubicacion_usuario'] as LatLng?;
    _ubicacionVigilante = snapshotData['ubicacion_vigilante'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ubicacion');

  static Stream<UbicacionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UbicacionRecord.fromSnapshot(s));

  static Future<UbicacionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UbicacionRecord.fromSnapshot(s));

  static UbicacionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UbicacionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UbicacionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UbicacionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UbicacionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UbicacionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUbicacionRecordData({
  LatLng? ubicacionUsuario,
  LatLng? ubicacionVigilante,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ubicacion_usuario': ubicacionUsuario,
      'ubicacion_vigilante': ubicacionVigilante,
    }.withoutNulls,
  );

  return firestoreData;
}

class UbicacionRecordDocumentEquality implements Equality<UbicacionRecord> {
  const UbicacionRecordDocumentEquality();

  @override
  bool equals(UbicacionRecord? e1, UbicacionRecord? e2) {
    return e1?.ubicacionUsuario == e2?.ubicacionUsuario &&
        e1?.ubicacionVigilante == e2?.ubicacionVigilante;
  }

  @override
  int hash(UbicacionRecord? e) =>
      const ListEquality().hash([e?.ubicacionUsuario, e?.ubicacionVigilante]);

  @override
  bool isValidKey(Object? o) => o is UbicacionRecord;
}
