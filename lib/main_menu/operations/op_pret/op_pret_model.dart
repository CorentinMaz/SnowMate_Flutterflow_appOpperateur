import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'op_pret_widget.dart' show OpPretWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OpPretModel extends FlutterFlowModel<OpPretWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Start snowOperation with parcoursId)] action in Button widget.
  ApiCallResponse? apiResultgjf;
  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (Modif snowOperation when operator within address)] action in Button widget.
  ApiCallResponse? apiResultip4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
