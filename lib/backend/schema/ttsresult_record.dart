import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TtsresultRecord extends FirestoreRecord {
  TtsresultRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "converte_tts" field.
  String? _converteTts;
  String get converteTts => _converteTts ?? '';
  bool hasConverteTts() => _converteTts != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "text2_convert" field.
  String? _text2Convert;
  String get text2Convert => _text2Convert ?? '';
  bool hasText2Convert() => _text2Convert != null;

  void _initializeFields() {
    _converteTts = snapshotData['converte_tts'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _text2Convert = snapshotData['text2_convert'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ttsresult');

  static Stream<TtsresultRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TtsresultRecord.fromSnapshot(s));

  static Future<TtsresultRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TtsresultRecord.fromSnapshot(s));

  static TtsresultRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TtsresultRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TtsresultRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TtsresultRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TtsresultRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TtsresultRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTtsresultRecordData({
  String? converteTts,
  DocumentReference? user,
  DateTime? timeCreated,
  String? text2Convert,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'converte_tts': converteTts,
      'user': user,
      'time_created': timeCreated,
      'text2_convert': text2Convert,
    }.withoutNulls,
  );

  return firestoreData;
}

class TtsresultRecordDocumentEquality implements Equality<TtsresultRecord> {
  const TtsresultRecordDocumentEquality();

  @override
  bool equals(TtsresultRecord? e1, TtsresultRecord? e2) {
    return e1?.converteTts == e2?.converteTts &&
        e1?.user == e2?.user &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.text2Convert == e2?.text2Convert;
  }

  @override
  int hash(TtsresultRecord? e) => const ListEquality()
      .hash([e?.converteTts, e?.user, e?.timeCreated, e?.text2Convert]);

  @override
  bool isValidKey(Object? o) => o is TtsresultRecord;
}
