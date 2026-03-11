import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SosHistorialRecord extends FirestoreRecord {
  SosHistorialRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "usuario" field.
  String? _usuario;
  String get usuario => _usuario ?? '';
  bool hasUsuario() => _usuario != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "longitud" field.
  double? _longitud;
  double get longitud => _longitud ?? 0.0;
  bool hasLongitud() => _longitud != null;

  // "latitud" field.
  double? _latitud;
  double get latitud => _latitud ?? 0.0;
  bool hasLatitud() => _latitud != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _usuario = snapshotData['usuario'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _longitud = castToType<double>(snapshotData['longitud']);
    _latitud = castToType<double>(snapshotData['latitud']);
    _email = snapshotData['email'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sos_historial');

  static Stream<SosHistorialRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SosHistorialRecord.fromSnapshot(s));

  static Future<SosHistorialRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SosHistorialRecord.fromSnapshot(s));

  static SosHistorialRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SosHistorialRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SosHistorialRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SosHistorialRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SosHistorialRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SosHistorialRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSosHistorialRecordData({
  String? usuario,
  DateTime? time,
  double? longitud,
  double? latitud,
  String? email,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'usuario': usuario,
      'time': time,
      'longitud': longitud,
      'latitud': latitud,
      'email': email,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class SosHistorialRecordDocumentEquality
    implements Equality<SosHistorialRecord> {
  const SosHistorialRecordDocumentEquality();

  @override
  bool equals(SosHistorialRecord? e1, SosHistorialRecord? e2) {
    return e1?.usuario == e2?.usuario &&
        e1?.time == e2?.time &&
        e1?.longitud == e2?.longitud &&
        e1?.latitud == e2?.latitud &&
        e1?.email == e2?.email &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(SosHistorialRecord? e) => const ListEquality().hash(
      [e?.usuario, e?.time, e?.longitud, e?.latitud, e?.email, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is SosHistorialRecord;
}
