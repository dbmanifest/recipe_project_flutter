import '/flutter_flow/flutter_flow_util.dart';
import 'modify_recipe_page_widget.dart' show ModifyRecipePageWidget;
import 'package:flutter/material.dart';

class ModifyRecipePageModel extends FlutterFlowModel<ModifyRecipePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
