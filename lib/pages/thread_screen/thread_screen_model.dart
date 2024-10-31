import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/chat_item_view_widget.dart';
import '/components/page_bg_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'thread_screen_widget.dart' show ThreadScreenWidget;
import 'package:flutter/material.dart';

class ThreadScreenModel extends FlutterFlowModel<ThreadScreenWidget> {
  ///  Local state fields for this page.

  bool hasValue = false;

  bool isLoading = false;

  List<ChatModelStruct> chatData = [];
  void addToChatData(ChatModelStruct item) => chatData.add(item);
  void removeFromChatData(ChatModelStruct item) => chatData.remove(item);
  void removeAtIndexFromChatData(int index) => chatData.removeAt(index);
  void insertAtIndexInChatData(int index, ChatModelStruct item) =>
      chatData.insert(index, item);
  void updateChatDataAtIndex(int index, Function(ChatModelStruct) updateFn) =>
      chatData[index] = updateFn(chatData[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (emilioAiAPI)] action in ThreadScreen widget.
  ApiCallResponse? initResponse;
  // Stores action output result for [Backend Call - Create Document] action in ThreadScreen widget.
  HistoryRecord? initHistoryData;
  // Model for page_bg component.
  late PageBgModel pageBgModel;
  // Models for ChatItemView dynamic component.
  late FlutterFlowDynamicModels<ChatItemViewModel> chatItemViewModels;
  // State field(s) for prompt widget.
  FocusNode? promptFocusNode;
  TextEditingController? promptTextController;
  String? Function(BuildContext, String?)? promptTextControllerValidator;
  // Stores action output result for [Backend Call - API (emilioAiAPI)] action in Icon widget.
  ApiCallResponse? response;
  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  HistoryRecord? historyData;

  @override
  void initState(BuildContext context) {
    pageBgModel = createModel(context, () => PageBgModel());
    chatItemViewModels = FlutterFlowDynamicModels(() => ChatItemViewModel());
  }

  @override
  void dispose() {
    pageBgModel.dispose();
    chatItemViewModels.dispose();
    promptFocusNode?.dispose();
    promptTextController?.dispose();
  }
}
