import '/components/history_item_view_widget.dart';
import '/components/page_bg_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'history_screen_widget.dart' show HistoryScreenWidget;
import 'package:flutter/material.dart';

class HistoryScreenModel extends FlutterFlowModel<HistoryScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for page_bg component.
  late PageBgModel pageBgModel;
  // Models for HistoryItemView dynamic component.
  late FlutterFlowDynamicModels<HistoryItemViewModel> historyItemViewModels;

  @override
  void initState(BuildContext context) {
    pageBgModel = createModel(context, () => PageBgModel());
    historyItemViewModels =
        FlutterFlowDynamicModels(() => HistoryItemViewModel());
  }

  @override
  void dispose() {
    pageBgModel.dispose();
    historyItemViewModels.dispose();
  }
}
