import '/flutter_flow/flutter_flow_util.dart';
import 'connexion_widget.dart' show ConnexionWidget;
import 'package:flutter/material.dart';
import '/backend/api_requests/api_calls.dart';

class ConnexionModel extends FlutterFlowModel<ConnexionWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  String? _addressTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ce Champ est obligatoire';
    }

    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ce Champ est obligatoire';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Login)] action in Button widget.
  ApiCallResponse? apiResultdn6;
  // Stores action output result for [Backend Call - API (Get operateur connect)] action in Button widget.
  ApiCallResponse? apiResults68;

  @override
  void initState(BuildContext context) {
    addressTextControllerValidator = _addressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    addressFocusNode?.dispose();
    addressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
