import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'history_item_view_model.dart';
export 'history_item_view_model.dart';

class HistoryItemViewWidget extends StatefulWidget {
  const HistoryItemViewWidget({
    super.key,
    required this.chat,
    required this.chatDocument,
  });

  final ChatModelStruct? chat;
  final DocumentReference? chatDocument;

  @override
  State<HistoryItemViewWidget> createState() => _HistoryItemViewWidgetState();
}

class _HistoryItemViewWidgetState extends State<HistoryItemViewWidget> {
  late HistoryItemViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryItemViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.25,
            children: [
              SlidableAction(
                label: 'Delete',
                backgroundColor: FlutterFlowTheme.of(context).error,
                icon: Icons.delete_rounded,
                onPressed: (_) async {
                  logFirebaseEvent('HISTORY_ITEM_VIEW_SlidableActionWidget_t');
                  logFirebaseEvent('SlidableActionWidget_backend_call');
                  await widget.chatDocument!.delete();
                },
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: ListTile(
              title: Text(
                widget.chat!.question,
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyLargeFamily),
                    ),
              ),
              subtitle: Text(
                (String var1) {
                  return var1.length <= 60 ? var1 : var1.substring(0, 60);
                }(widget.chat!.answer),
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).labelMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelMediumFamily),
                    ),
              ),
              tileColor: Colors.transparent,
              dense: true,
            ),
          ),
        ),
        Divider(
          thickness: 1.0,
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ],
    );
  }
}
