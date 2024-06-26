import '/flutter_flow/flutter_flow_util.dart';
import 'recipe1_step3_widget.dart' show Recipe1Step3Widget;
import 'package:flutter/material.dart';

class Recipe1Step3Model extends FlutterFlowModel<Recipe1Step3Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  
  // State fields for TextField widget 1
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  List<bool> checkboxValues1 = [false, false]; // Added to hold the checkbox values

  // State fields for TextField widget 2
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  List<bool> checkboxValues2 = [false, false]; // Added to hold the checkbox values

  // State fields for Checkbox group 3
  List<bool> checkboxValues3 = [false, false]; // Added to hold the checkbox values

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();
    
    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
