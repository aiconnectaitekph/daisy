import '/components/page_bg_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'voice_widget.dart' show VoiceWidget;
import 'package:flutter/material.dart';

class VoiceModel extends FlutterFlowModel<VoiceWidget> {
  ///  State fields for stateful widgets in this page.

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
