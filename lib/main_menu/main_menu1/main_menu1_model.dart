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
import 'main_menu1_widget.dart' show MainMenu1Widget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainMenu1Model extends FlutterFlowModel<MainMenu1Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get snowOperations with parcoursId)] action in MainMenu1 widget.
  ApiCallResponse? snowOperation;
  // Stores action output result for [Backend Call - API (Get snowOperations with parcoursId)] action in Button widget.
  ApiCallResponse? snowOperationCopy;
  // Stores action output result for [Backend Call - API (Get snowOperations with parcoursId)] action in ButtonEnCours widget.
  ApiCallResponse? operation;
  // Model for SansOp component.
  late SansOpModel sansOpModel;
  // Model for OpPrevu component.
  late OpPrevuModel opPrevuModel;
  // Model for OpPret component.
  late OpPretModel opPretModel;
  // Model for OpEnCours component.
  late OpEnCoursModel opEnCoursModel;

  @override
  void initState(BuildContext context) {
    sansOpModel = createModel(context, () => SansOpModel());
    opPrevuModel = createModel(context, () => OpPrevuModel());
    opPretModel = createModel(context, () => OpPretModel());
    opEnCoursModel = createModel(context, () => OpEnCoursModel());
  }

  @override
  void dispose() {
    sansOpModel.dispose();
    opPrevuModel.dispose();
    opPretModel.dispose();
    opEnCoursModel.dispose();
  }
}
