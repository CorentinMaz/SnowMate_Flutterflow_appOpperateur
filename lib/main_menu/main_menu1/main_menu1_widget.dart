import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_menu/operations/op_en_cours/op_en_cours_widget.dart';
import '/main_menu/operations/op_pret/op_pret_widget.dart';
import '/main_menu/operations/op_prevu/op_prevu_widget.dart';
import '/main_menu/operations/sans_op/sans_op_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_menu1_model.dart';
export 'main_menu1_model.dart';

class MainMenu1Widget extends StatefulWidget {
  const MainMenu1Widget({super.key});

  @override
  State<MainMenu1Widget> createState() => _MainMenu1WidgetState();
}

class _MainMenu1WidgetState extends State<MainMenu1Widget>
    with TickerProviderStateMixin {
  late MainMenu1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainMenu1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.snowOperation = await GetSnowOperationsWithParcoursIdCall.call(
        parcoursId: getJsonField(
          FFAppState().operator,
          r'''$.parcours.id''',
        ).toString().toString(),
        authToken: FFAppState().authToken,
      );

      if (getJsonField(
            (_model.snowOperation?.jsonBody ?? ''),
            r'''$.id''',
          ) !=
          null) {
        FFAppState().isResponseValid = true;
        safeSetState(() {});
      } else {
        FFAppState().isResponseValid = false;
        safeSetState(() {});
      }

      FFAppState().snowOperation = (_model.snowOperation?.jsonBody ?? '');
      safeSetState(() {});
    });

    animationsMap.addAll({
      'iconOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'iconOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Dispatch',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).headlineMediumFamily),
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
              child: Icon(
                FFIcons.ksettingsF,
                color: FlutterFlowTheme.of(context).accent4,
                size: 30.0,
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            '${getJsonField(
                              FFAppState().operator,
                              r'''$.firstName''',
                            ).toString()} ${getJsonField(
                              FFAppState().operator,
                              r'''$.lastName''',
                            ).toString()}',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineLargeFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineLargeFamily),
                                ),
                          ),
                        ),
                        Stack(
                          children: [
                            if ((FFAppState().isResponseValid == false) ||
                                ((FFAppState().isResponseValid == true) &&
                                    !getJsonField(
                                      FFAppState().snowOperation,
                                      r'''$.isStart''',
                                    )))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Parcours :   ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          TextSpan(
                                            text: getJsonField(
                                              FFAppState().operator,
                                              r'''$.parcours.name''',
                                            ).toString(),
                                            style: TextStyle(),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                    AlignedTooltip(
                                      content: Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text(
                                          'Recharger la page',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeFamily),
                                              ),
                                        ),
                                      ),
                                      offset: 4.0,
                                      preferredDirection: AxisDirection.down,
                                      borderRadius: BorderRadius.circular(8.0),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      elevation: 4.0,
                                      tailBaseWidth: 24.0,
                                      tailLength: 12.0,
                                      waitDuration: Duration(milliseconds: 10),
                                      showDuration: Duration(milliseconds: 150),
                                      triggerMode: TooltipTriggerMode.tap,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (animationsMap[
                                                  'iconOnActionTriggerAnimation1'] !=
                                              null) {
                                            await animationsMap[
                                                    'iconOnActionTriggerAnimation1']!
                                                .controller
                                                .forward(from: 0.0);
                                          }
                                          _model.snowOperationCopy =
                                              await GetSnowOperationsWithParcoursIdCall
                                                  .call(
                                            parcoursId: getJsonField(
                                              FFAppState().operator,
                                              r'''$.parcours.id''',
                                            ).toString(),
                                            authToken: FFAppState().authToken,
                                          );

                                          if (getJsonField(
                                                (_model.snowOperationCopy
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.id''',
                                              ) !=
                                              null) {
                                            FFAppState().isResponseValid = true;
                                            safeSetState(() {});
                                          } else {
                                            FFAppState().isResponseValid =
                                                false;
                                            safeSetState(() {});
                                          }

                                          FFAppState().snowOperation = (_model
                                                  .snowOperationCopy
                                                  ?.jsonBody ??
                                              '');
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.replay,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 28.0,
                                        ),
                                      ).animateOnActionTrigger(
                                        animationsMap[
                                            'iconOnActionTriggerAnimation1']!,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if ((FFAppState().isResponseValid == true) &&
                                getJsonField(
                                  FFAppState().snowOperation,
                                  r'''$.isStart''',
                                ))
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Divider(
                                      thickness: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        'Opération en cours :',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeFamily),
                                            ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Parcours :   ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: getJsonField(
                                                    FFAppState().operator,
                                                    r'''$.parcours.name''',
                                                  ).toString(),
                                                  style: TextStyle(),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ),
                                        ),
                                        AlignedTooltip(
                                          content: Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Text(
                                              'Recharger la page',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily),
                                                      ),
                                            ),
                                          ),
                                          offset: 4.0,
                                          preferredDirection:
                                              AxisDirection.down,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 4.0,
                                          tailBaseWidth: 24.0,
                                          tailLength: 12.0,
                                          waitDuration:
                                              Duration(milliseconds: 10),
                                          showDuration:
                                              Duration(milliseconds: 150),
                                          triggerMode: TooltipTriggerMode.tap,
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (animationsMap[
                                                      'iconOnActionTriggerAnimation2'] !=
                                                  null) {
                                                await animationsMap[
                                                        'iconOnActionTriggerAnimation2']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              _model.operation =
                                                  await GetSnowOperationsWithParcoursIdCall
                                                      .call(
                                                parcoursId: getJsonField(
                                                  FFAppState().operator,
                                                  r'''$.parcours.id''',
                                                ).toString(),
                                                authToken:
                                                    FFAppState().authToken,
                                              );

                                              if (getJsonField(
                                                    (_model.operation
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.id''',
                                                  ) !=
                                                  null) {
                                                FFAppState().isResponseValid =
                                                    true;
                                                safeSetState(() {});
                                              } else {
                                                FFAppState().isResponseValid =
                                                    false;
                                                safeSetState(() {});
                                              }

                                              FFAppState().snowOperation =
                                                  (_model.operation?.jsonBody ??
                                                      '');
                                              safeSetState(() {});

                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons.replay,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 28.0,
                                            ),
                                          ).animateOnActionTrigger(
                                            animationsMap[
                                                'iconOnActionTriggerAnimation2']!,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]
                                      .divide(SizedBox(height: 5.0))
                                      .around(SizedBox(height: 5.0)),
                                ),
                              ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Stack(
                              children: [
                                if (FFAppState().isResponseValid == false)
                                  wrapWithModel(
                                    model: _model.sansOpModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: SansOpWidget(),
                                  ),
                                if ((FFAppState().isResponseValid == true) &&
                                    !getJsonField(
                                      FFAppState().snowOperation,
                                      r'''$.isConfirmed''',
                                    ))
                                  wrapWithModel(
                                    model: _model.opPrevuModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: OpPrevuWidget(),
                                  ),
                                if ((FFAppState().isResponseValid == true) &&
                                    getJsonField(
                                      FFAppState().snowOperation,
                                      r'''$.isConfirmed''',
                                    ))
                                  wrapWithModel(
                                    model: _model.opPretModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: OpPretWidget(),
                                  ),
                                if ((FFAppState().isResponseValid == true) &&
                                    getJsonField(
                                      FFAppState().snowOperation,
                                      r'''$.isStart''',
                                    ))
                                  wrapWithModel(
                                    model: _model.opEnCoursModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: OpEnCoursWidget(),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 10.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
