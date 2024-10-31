// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnswerModelStruct extends FFFirebaseStruct {
  AnswerModelStruct({
    String? id,
    String? object,
    int? created,
    String? model,
    List<ChoicesModelStruct>? choices,
    String? systemFingerprint,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _object = object,
        _created = created,
        _model = model,
        _choices = choices,
        _systemFingerprint = systemFingerprint,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "object" field.
  String? _object;
  String get object => _object ?? '';
  set object(String? val) => _object = val;

  bool hasObject() => _object != null;

  // "created" field.
  int? _created;
  int get created => _created ?? 0;
  set created(int? val) => _created = val;

  void incrementCreated(int amount) => created = created + amount;

  bool hasCreated() => _created != null;

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  set model(String? val) => _model = val;

  bool hasModel() => _model != null;

  // "choices" field.
  List<ChoicesModelStruct>? _choices;
  List<ChoicesModelStruct> get choices => _choices ?? const [];
  set choices(List<ChoicesModelStruct>? val) => _choices = val;

  void updateChoices(Function(List<ChoicesModelStruct>) updateFn) {
    updateFn(_choices ??= []);
  }

  bool hasChoices() => _choices != null;

  // "system_fingerprint" field.
  String? _systemFingerprint;
  String get systemFingerprint => _systemFingerprint ?? '';
  set systemFingerprint(String? val) => _systemFingerprint = val;

  bool hasSystemFingerprint() => _systemFingerprint != null;

  static AnswerModelStruct fromMap(Map<String, dynamic> data) =>
      AnswerModelStruct(
        id: data['id'] as String?,
        object: data['object'] as String?,
        created: castToType<int>(data['created']),
        model: data['model'] as String?,
        choices: getStructList(
          data['choices'],
          ChoicesModelStruct.fromMap,
        ),
        systemFingerprint: data['system_fingerprint'] as String?,
      );

  static AnswerModelStruct? maybeFromMap(dynamic data) => data is Map
      ? AnswerModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'object': _object,
        'created': _created,
        'model': _model,
        'choices': _choices?.map((e) => e.toMap()).toList(),
        'system_fingerprint': _systemFingerprint,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'object': serializeParam(
          _object,
          ParamType.String,
        ),
        'created': serializeParam(
          _created,
          ParamType.int,
        ),
        'model': serializeParam(
          _model,
          ParamType.String,
        ),
        'choices': serializeParam(
          _choices,
          ParamType.DataStruct,
          isList: true,
        ),
        'system_fingerprint': serializeParam(
          _systemFingerprint,
          ParamType.String,
        ),
      }.withoutNulls;

  static AnswerModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      AnswerModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        object: deserializeParam(
          data['object'],
          ParamType.String,
          false,
        ),
        created: deserializeParam(
          data['created'],
          ParamType.int,
          false,
        ),
        model: deserializeParam(
          data['model'],
          ParamType.String,
          false,
        ),
        choices: deserializeStructParam<ChoicesModelStruct>(
          data['choices'],
          ParamType.DataStruct,
          true,
          structBuilder: ChoicesModelStruct.fromSerializableMap,
        ),
        systemFingerprint: deserializeParam(
          data['system_fingerprint'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AnswerModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AnswerModelStruct &&
        id == other.id &&
        object == other.object &&
        created == other.created &&
        model == other.model &&
        listEquality.equals(choices, other.choices) &&
        systemFingerprint == other.systemFingerprint;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, object, created, model, choices, systemFingerprint]);
}

AnswerModelStruct createAnswerModelStruct({
  String? id,
  String? object,
  int? created,
  String? model,
  String? systemFingerprint,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AnswerModelStruct(
      id: id,
      object: object,
      created: created,
      model: model,
      systemFingerprint: systemFingerprint,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AnswerModelStruct? updateAnswerModelStruct(
  AnswerModelStruct? answerModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    answerModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAnswerModelStructData(
  Map<String, dynamic> firestoreData,
  AnswerModelStruct? answerModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (answerModel == null) {
    return;
  }
  if (answerModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && answerModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final answerModelData =
      getAnswerModelFirestoreData(answerModel, forFieldValue);
  final nestedData =
      answerModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = answerModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAnswerModelFirestoreData(
  AnswerModelStruct? answerModel, [
  bool forFieldValue = false,
]) {
  if (answerModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(answerModel.toMap());

  // Add any Firestore field values
  answerModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAnswerModelListFirestoreData(
  List<AnswerModelStruct>? answerModels,
) =>
    answerModels?.map((e) => getAnswerModelFirestoreData(e, true)).toList() ??
    [];
