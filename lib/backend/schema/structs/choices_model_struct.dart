// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChoicesModelStruct extends FFFirebaseStruct {
  ChoicesModelStruct({
    int? index,
    MessageModelStruct? message,
    String? finishReason,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _index = index,
        _message = message,
        _finishReason = finishReason,
        super(firestoreUtilData);

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;

  void incrementIndex(int amount) => index = index + amount;

  bool hasIndex() => _index != null;

  // "message" field.
  MessageModelStruct? _message;
  MessageModelStruct get message => _message ?? MessageModelStruct();
  set message(MessageModelStruct? val) => _message = val;

  void updateMessage(Function(MessageModelStruct) updateFn) {
    updateFn(_message ??= MessageModelStruct());
  }

  bool hasMessage() => _message != null;

  // "finish_reason" field.
  String? _finishReason;
  String get finishReason => _finishReason ?? '';
  set finishReason(String? val) => _finishReason = val;

  bool hasFinishReason() => _finishReason != null;

  static ChoicesModelStruct fromMap(Map<String, dynamic> data) =>
      ChoicesModelStruct(
        index: castToType<int>(data['index']),
        message: MessageModelStruct.maybeFromMap(data['message']),
        finishReason: data['finish_reason'] as String?,
      );

  static ChoicesModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ChoicesModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'index': _index,
        'message': _message?.toMap(),
        'finish_reason': _finishReason,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
        'message': serializeParam(
          _message,
          ParamType.DataStruct,
        ),
        'finish_reason': serializeParam(
          _finishReason,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChoicesModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChoicesModelStruct(
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
        message: deserializeStructParam(
          data['message'],
          ParamType.DataStruct,
          false,
          structBuilder: MessageModelStruct.fromSerializableMap,
        ),
        finishReason: deserializeParam(
          data['finish_reason'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChoicesModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChoicesModelStruct &&
        index == other.index &&
        message == other.message &&
        finishReason == other.finishReason;
  }

  @override
  int get hashCode => const ListEquality().hash([index, message, finishReason]);
}

ChoicesModelStruct createChoicesModelStruct({
  int? index,
  MessageModelStruct? message,
  String? finishReason,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChoicesModelStruct(
      index: index,
      message: message ?? (clearUnsetFields ? MessageModelStruct() : null),
      finishReason: finishReason,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChoicesModelStruct? updateChoicesModelStruct(
  ChoicesModelStruct? choicesModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    choicesModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChoicesModelStructData(
  Map<String, dynamic> firestoreData,
  ChoicesModelStruct? choicesModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (choicesModel == null) {
    return;
  }
  if (choicesModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && choicesModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final choicesModelData =
      getChoicesModelFirestoreData(choicesModel, forFieldValue);
  final nestedData =
      choicesModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = choicesModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChoicesModelFirestoreData(
  ChoicesModelStruct? choicesModel, [
  bool forFieldValue = false,
]) {
  if (choicesModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(choicesModel.toMap());

  // Handle nested data for "message" field.
  addMessageModelStructData(
    firestoreData,
    choicesModel.hasMessage() ? choicesModel.message : null,
    'message',
    forFieldValue,
  );

  // Add any Firestore field values
  choicesModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChoicesModelListFirestoreData(
  List<ChoicesModelStruct>? choicesModels,
) =>
    choicesModels?.map((e) => getChoicesModelFirestoreData(e, true)).toList() ??
    [];
