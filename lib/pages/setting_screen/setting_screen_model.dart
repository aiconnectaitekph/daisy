import '/components/page_bg_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'setting_screen_widget.dart' show SettingScreenWidget;
import 'package:flutter/material.dart';

class SettingScreenModel extends FlutterFlowModel<SettingScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for page_bg component.
  late PageBgModel pageBgModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {
    pageBgModel = createModel(context, () => PageBgModel());
  }

  @override
  void dispose() {
    pageBgModel.dispose();
  }
}
