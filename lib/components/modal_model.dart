import '/flutter_flow/flutter_flow_util.dart';
import 'modal_widget.dart' show ModalWidget;
import 'package:flutter/material.dart';

class ModalModel extends FlutterFlowModel<ModalWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }
}
