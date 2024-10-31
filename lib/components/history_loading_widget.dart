import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'history_loading_model.dart';
export 'history_loading_model.dart';

class HistoryLoadingWidget extends StatefulWidget {
  const HistoryLoadingWidget({super.key});

  @override
  State<HistoryLoadingWidget> createState() => _HistoryLoadingWidgetState();
}

class _HistoryLoadingWidgetState extends State<HistoryLoadingWidget>
    with TickerProviderStateMixin {
  late HistoryLoadingModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryLoadingModel());

    animationsMap.addAll({
      'listViewOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0xFF7E8999),
            angle: 0.524,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final temp = List.generate(
            random_data.randomInteger(5, 5),
            (index) => random_data.randomString(
                  0,
                  0,
                  true,
                  false,
                  false,
                )).toList().take(10).toList();

        return ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: temp.length,
          itemBuilder: (context, tempIndex) {
            final tempItem = temp[tempIndex];
            return Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      valueOrDefault<double>(
                        functions.getHorizontalSize(
                            MediaQuery.sizeOf(context).width, 16.0),
                        0.0,
                      ),
                      0.0,
                      valueOrDefault<double>(
                        functions.getHorizontalSize(
                            MediaQuery.sizeOf(context).width, 16.0),
                        0.0,
                      ),
                      valueOrDefault<double>(
                        functions.getVerticalSize(
                            MediaQuery.sizeOf(context).height, 10.0),
                        0.0,
                      )),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            0.0,
                            0.0,
                            valueOrDefault<double>(
                              functions.getVerticalSize(
                                  MediaQuery.sizeOf(context).height, 10.0),
                              0.0,
                            )),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          height: functions.getVerticalSize(
                              MediaQuery.sizeOf(context).height, 25.0),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: functions.getVerticalSize(
                            MediaQuery.sizeOf(context).height, 25.0),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ],
            );
          },
        ).animateOnPageLoad(animationsMap['listViewOnPageLoadAnimation']!);
      },
    );
  }
}
