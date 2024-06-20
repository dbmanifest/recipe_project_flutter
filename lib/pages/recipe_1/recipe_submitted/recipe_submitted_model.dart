import '/flutter_flow/flutter_flow_util.dart';
import 'recipe_submitted_widget.dart' show RecipeSubmittedWidget;
import 'package:flutter/material.dart';

class RecipeSubmittedModel extends FlutterFlowModel<RecipeSubmittedWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
