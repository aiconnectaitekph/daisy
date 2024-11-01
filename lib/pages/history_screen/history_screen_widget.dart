import '/backend/backend.dart';
import '/components/history_item_view_widget.dart';
import '/components/history_loading_widget.dart';
import '/components/page_bg_widget.dart';
import '/components/thread_empty_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'history_screen_model.dart';
export 'history_screen_model.dart';

class HistoryScreenWidget extends StatefulWidget {
  const HistoryScreenWidget({super.key});

  @override
  State<HistoryScreenWidget> createState() => _HistoryScreenWidgetState();
}

class _HistoryScreenWidgetState extends State<HistoryScreenWidget> {
  late HistoryScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'HistoryScreen'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            if (Theme.of(context).brightness == Brightness.dark)
              wrapWithModel(
                model: _model.pageBgModel,
                updateCallback: () => safeSetState(() {}),
                child: const PageBgWidget(),
              ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 56.0,
                    decoration: const BoxDecoration(),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Threads',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineMediumFamily),
                                ),
                          ),
                        ].divide(const SizedBox(width: 16.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          valueOrDefault<double>(
                            functions.getVerticalSize(
                                MediaQuery.sizeOf(context).height, 16.0),
                            0.0,
                          ),
                          0.0,
                          0.0),
                      child: StreamBuilder<List<HistoryItemsRecord>>(
                        stream: queryHistoryItemsRecord(
                          parent: FFAppState().historyReference,
                          queryBuilder: (historyItemsRecord) =>
                              historyItemsRecord.orderBy('historyId',
                                  descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return const HistoryLoadingWidget();
                          }
                          List<HistoryItemsRecord>
                              listViewHistoryItemsRecordList = snapshot.data!;
                          if (listViewHistoryItemsRecordList.isEmpty) {
                            return const ThreadEmptyWidget();
                          }

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewHistoryItemsRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewHistoryItemsRecord =
                                  listViewHistoryItemsRecordList[listViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'HISTORY_SCREEN_Container_3zn7ld7p_ON_TAP');
                                  logFirebaseEvent(
                                      'HistoryItemView_navigate_to');

                                  context.pushNamed(
                                    'ThreadScreen',
                                    queryParameters: {
                                      'collectionId': serializeParam(
                                        listViewHistoryItemsRecord
                                            .data.last.created,
                                        ParamType.int,
                                      ),
                                      'thread': serializeParam(
                                        listViewHistoryItemsRecord,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'thread': listViewHistoryItemsRecord,
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                },
                                child: wrapWithModel(
                                  model: _model.historyItemViewModels.getModel(
                                    listViewHistoryItemsRecord.historyId
                                        .toString(),
                                    listViewIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: HistoryItemViewWidget(
                                    key: Key(
                                      'Key3zn_${listViewHistoryItemsRecord.historyId.toString()}',
                                    ),
                                    chat: listViewHistoryItemsRecord.data.last,
                                    chatDocument:
                                        listViewHistoryItemsRecord.reference,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
