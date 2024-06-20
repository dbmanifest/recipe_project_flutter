import '/flutter_flow/flutter_flow_util.dart';
import 'validate_recipe_page_widget.dart' show ValidateRecipePageWidget;
import 'package:flutter/material.dart';

class ValidateRecipePageModel
    extends FlutterFlowModel<ValidateRecipePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
