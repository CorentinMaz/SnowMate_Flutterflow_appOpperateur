import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'op_pret_model.dart';
export 'op_pret_model.dart';

class OpPretWidget extends StatefulWidget {
  const OpPretWidget({super.key});

  @override
  State<OpPretWidget> createState() => _OpPretWidgetState();
}

class _OpPretWidgetState extends State<OpPretWidget> {
  late OpPretModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OpPretModel());
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
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: functions.isWithinOneHourOrPast(getJsonField(
        FFAppState().snowOperation,
        r'''$.operationDate''',
      ))
          ? 120.0
          : 160.0,
      decoration: BoxDecoration(
        color: Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Date de l\'opération : ',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                    ),
                    TextSpan(
                      text: valueOrDefault<String>(
                        functions.dateConverter(getJsonField(
                          FFAppState().snowOperation,
                          r'''$.operationDate''',
                        )),
                        '\"\"',
                      ),
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontWeight: FontWeight.bold,
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
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: FFButtonWidget(
                onPressed: !functions.isWithinOneHourOrPast(getJsonField(
                  FFAppState().snowOperation,
                  r'''$.operationDate''',
                ))
                    ? null
                    : () async {
                        currentUserLocationValue = await getCurrentUserLocation(
                            defaultLocation: LatLng(0.0, 0.0));
                        var _shouldSetState = false;
                        _model.apiResultgjf =
                            await StartSnowOperationWithParcoursIdCall.call(
                          parcoursId: getJsonField(
                            FFAppState().snowOperation,
                            r'''$.parcours_id''',
                          ).toString(),
                          authToken: FFAppState().authToken,
                        );

                        _shouldSetState = true;
                        if ((_model.apiResultgjf?.succeeded ?? true)) {
                          await actions.showToastNotification(
                            context,
                            'Votre opération commence !',
                            'success',
                          );
                          FFAppState().snowOperation =
                              functions.updateSnowOperation(
                                  FFAppState().snowOperation, 2, '')!;
                          FFAppState().update(() {});
                        }
                        _model.instantTimer = InstantTimer.periodic(
                          duration: Duration(milliseconds: 5000),
                          callback: (timer) async {
                            currentUserLocationValue =
                                await getCurrentUserLocation(
                                    defaultLocation: LatLng(0.0, 0.0));
                            if (FFAppState().isResponseValid == true) {
                              FFAppState().addToCurrentDate(
                                  getCurrentTimestamp.millisecondsSinceEpoch);
                              FFAppState().addToCurrentLocation(
                                  functions.updateCurrentLocation(
                                      currentUserLocationValue!,
                                      FFAppState().currentLocation.lastOrNull,
                                      functions.isWithinProximity(
                                          currentUserLocationValue!,
                                          getJsonField(
                                            functions.getFirstIncompleteAddress(
                                                getJsonField(
                                              FFAppState().snowOperation,
                                              r'''$.adresses''',
                                              true,
                                            )!),
                                            r'''$.client.geocodeAdresses.lat''',
                                          ),
                                          getJsonField(
                                            functions.getFirstIncompleteAddress(
                                                getJsonField(
                                              FFAppState().snowOperation,
                                              r'''$.adresses''',
                                              true,
                                            )!),
                                            r'''$.client.geocodeAdresses.lng''',
                                          ))));
                              safeSetState(() {});
                              if (((String lastZone) {
                                    return lastZone.contains("IN");
                                  }(getJsonField(
                                    FFAppState().currentLocation.lastOrNull,
                                    r'''$.zone''',
                                  ).toString())) &&
                                  (((String lastZone) {
                                        return lastZone.contains("OUT");
                                      }(getJsonField(
                                        FFAppState()
                                            .currentLocation
                                            .elementAtOrNull(FFAppState()
                                                    .currentLocation
                                                    .length -
                                                1),
                                        r'''$.zone''',
                                      ).toString())) &&
                                      ((String lastZone) {
                                        return lastZone.contains("NAN");
                                      }(getJsonField(
                                        FFAppState()
                                            .currentLocation
                                            .elementAtOrNull(FFAppState()
                                                    .currentLocation
                                                    .length -
                                                1),
                                        r'''$.zone''',
                                      ).toString())))) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('test'),
                                      content: Text(
                                          'Tu viens de rentrer dans la zone'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                              if ((String lastZone) {
                                return lastZone.contains("OUT");
                              }(getJsonField(
                                FFAppState().currentLocation.lastOrNull,
                                r'''$.zone''',
                              ).toString())) {
                                _model.apiResultip4 =
                                    await ModifSnowOperationWhenOperatorWithinAddressCall
                                        .call(
                                  authToken: FFAppState().authToken,
                                  snowoperationsId: getJsonField(
                                    FFAppState().snowOperation,
                                    r'''$.id''',
                                  ),
                                );

                                _shouldSetState = true;
                                FFAppState().snowOperation =
                                    functions.updateSnowOperation(
                                        FFAppState().snowOperation,
                                        3,
                                        getJsonField(
                                          functions.getFirstIncompleteAddress(
                                              getJsonField(
                                            FFAppState().snowOperation,
                                            r'''$.adresses''',
                                            true,
                                          )!),
                                          r'''$.client.id''',
                                        ).toString())!;
                                FFAppState().update(() {});
                              }
                              if (_shouldSetState) safeSetState(() {});
                              return;
                            } else {
                              _model.instantTimer?.cancel();
                              if (_shouldSetState) safeSetState(() {});
                              return;
                            }
                          },
                          startImmediately: true,
                        );

                        if (_shouldSetState) safeSetState(() {});
                      },
                text: 'Commencer',
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
            if (functions.isWithinOneHourOrPast(getJsonField(
                  FFAppState().snowOperation,
                  r'''$.operationDate''',
                )) ==
                false)
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  'Vous pouvez commencer 1h avant l\'heure de l\'opération',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).error,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
          ].divide(SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
