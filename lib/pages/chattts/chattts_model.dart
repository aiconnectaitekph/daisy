import '/backend/backend.dart';
import '/components/page_bg_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chattts_widget.dart' show ChatttsWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class ChatttsModel extends FlutterFlowModel<ChatttsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Chattts widget.
  HistoryRecord? historyRef;
  // Model for page_bg component.
  late PageBgModel pageBgModel;
  AudioRecorder? audioRecorder;
  String? stopAudioRecord;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {
    pageBgModel = createModel(context, () => PageBgModel());
  }

  @override
  void dispose() {
    pageBgModel.dispose();
  }
}
