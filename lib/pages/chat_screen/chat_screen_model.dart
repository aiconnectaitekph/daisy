import '/backend/backend.dart';
import '/components/page_bg_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_screen_widget.dart' show ChatScreenWidget;
import 'package:flutter/material.dart';

class ChatScreenModel extends FlutterFlowModel<ChatScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in ChatScreen widget.
  HistoryRecord? historyRef;
  // Model for page_bg component.
  late PageBgModel pageBgModel;

  @override
  void initState(BuildContext context) {
    pageBgModel = createModel(context, () => PageBgModel());
  }

  @override
  void dispose() {
    pageBgModel.dispose();
  }
}