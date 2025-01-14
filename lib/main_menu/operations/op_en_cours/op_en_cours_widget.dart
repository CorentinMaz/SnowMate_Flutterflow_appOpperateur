import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'op_en_cours_model.dart';
export 'op_en_cours_model.dart';

class OpEnCoursWidget extends StatefulWidget {
  const OpEnCoursWidget({super.key});

  @override
  State<OpEnCoursWidget> createState() => _OpEnCoursWidgetState();
}

class _OpEnCoursWidgetState extends State<OpEnCoursWidget> {
  late OpEnCoursModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OpEnCoursModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      height: 170.0,
      decoration: BoxDecoration(
        color: Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    'Progression : ',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                  ),
                ),
                RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${getJsonField(
                          FFAppState().snowOperation,
                          r'''$.nbAdressesDone''',
                        ).toString()}/${getJsonField(
                          FFAppState().snowOperation,
                          r'''$.nbAdresses''',
                        ).toString()}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      )
                    ],
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: LinearPercentIndicator(
                    percent: getJsonField(
                          FFAppState().snowOperation,
                          r'''$.nbAdressesDone''',
                        ) /
                        getJsonField(
                          FFAppState().snowOperation,
                          r'''$.nbAdresses''',
                        ),
                    lineHeight: 10.0,
                    animation: true,
                    animateFromLastPercent: true,
                    progressColor: FlutterFlowTheme.of(context).primary,
                    backgroundColor: Color(0xFFAFAFAF),
                    barRadius: Radius.circular(10.0),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Fin du parcours ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      TextSpan(
                        text: '(Estimé)',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      TextSpan(
                        text: ' : ',
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: functions.convertMinutesToHours(getJsonField(
                          FFAppState().snowOperation,
                          r'''$.totalEstimatedTime''',
                        )),
                        style: TextStyle(),
                      )
                    ],
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 10.0),
              child: FFButtonWidget(
                onPressed: ((getJsonField(
                              FFAppState().snowOperation,
                              r'''$.nbAdresses''',
                            ) -
                            1) >
                        getJsonField(
                          FFAppState().snowOperation,
                          r'''$.nbAdressesDone''',
                        ))
                    ? null
                    : () async {
                        _model.apiResult31s =
                            await AddSnowOperationHistoryCall.call(
                          authToken: FFAppState().authToken,
                          snowoperationsId: getJsonField(
                            FFAppState().snowOperation,
                            r'''$.id''',
                          ),
                          currentDateList: FFAppState().currentDate,
                          currentLocationJson: FFAppState().currentLocation,
                        );

                        if ((_model.apiResult31s?.succeeded ?? true)) {
                          await actions.showToastNotification(
                            context,
                            'Votre parcours est terminé !',
                            'success',
                          );
                          FFAppState().snowOperation =
                              functions.updateSnowOperation(
                                  FFAppState().snowOperation, 0, '')!;
                          FFAppState().isResponseValid = false;
                          FFAppState().currentDate = [];
                          FFAppState().currentLocation = [];
                          FFAppState().update(() {});
                        }

                        safeSetState(() {});
                      },
                text: 'Terminer',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: Colors.white,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleSmallFamily),
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                  disabledColor: FlutterFlowTheme.of(context).secondaryText,
                ),
              ),
            ),
          ].divide(SizedBox(height: 5.0)),
        ),
      ),
    );
  }
}
