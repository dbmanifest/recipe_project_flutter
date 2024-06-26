import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'recipe1_step5_model.dart';
export 'recipe1_step5_model.dart';

class Recipe1Step5Widget extends StatefulWidget {
  const Recipe1Step5Widget({super.key});

  @override
  State<Recipe1Step5Widget> createState() => _Recipe1Step5WidgetState();
}

class _Recipe1Step5WidgetState extends State<Recipe1Step5Widget> {
  late Recipe1Step5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isConfirmed = false;
  final TextEditingController _verificationCodeController = TextEditingController();

  void _showVerificationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Verify and Proceed'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxListTile(
                    title: Text('Confirm That These Are The Correct Values'),
                    value: _isConfirmed,
                    onChanged: (bool? value) {
                      setState(() {
                        _isConfirmed = value ?? false;
                      });
                    },
                  ),
                  TextField(
                    controller: _verificationCodeController,
                    decoration: InputDecoration(
                      labelText: 'Verifier\'s Secret Code',
                      hintText: 'Enter 4-digit code',
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Proceed'),
                  onPressed: _isConfirmed && _verificationCodeController.text.length == 4
                      ? () {
                          Navigator.of(context).pop();
                          context.pushNamed('recipe_1_step_6');
                        }
                      : null,
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Recipe1Step5Model());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    _verificationCodeController.dispose();
    super.dispose();
  }

  Widget buildFieldWithCheckboxes(String hintText, TextEditingController controller, FocusNode focusNode, List<bool> checkboxValues, double width) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 8.0, 20.0),
          child: SizedBox(
            width: width * 0.3,
            child: TextFormField(
              controller: controller,
              focusNode: focusNode,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).alternate,
                      letterSpacing: 0.0,
                    ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).alternate,
                    letterSpacing: 0.0,
                  ),
              textAlign: TextAlign.center,
              validator: _model.textController1Validator.asValidator(context),
            ),
          ),
        ),
        buildCheckboxGroup(
          'Recorded By Digital Initials',
          'Verified By Initials',
          checkboxValues[0],
          checkboxValues[1],
          (newValue) => setState(() => checkboxValues[0] = newValue!),
          (newValue) => setState(() => checkboxValues[1] = newValue!),
        ),
      ],
    );
  }

  Widget buildCheckboxGroup(
    String label1,
    String label2,
    bool value1,
    bool value2,
    void Function(bool?) onChanged1,
    void Function(bool?) onChanged2,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: value1,
              onChanged: onChanged1,
            ),
            Text(label1),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: value2,
              onChanged: onChanged2,
            ),
            Text(label2),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Step 5',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double width = constraints.maxWidth;
              return Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Dispensing Pt 2.',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                    buildFieldWithCheckboxes(
                      'Room #',
                      _model.textController1!,
                      _model.textFieldFocusNode1!,
                      _model.checkboxValues1,
                      width,
                    ),
                    buildFieldWithCheckboxes(
                      'Balance ID',
                      _model.textController2!,
                      _model.textFieldFocusNode2!,
                      _model.checkboxValues2,
                      width,
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                child: Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    unselectedWidgetColor: FlutterFlowTheme.of(context).primary,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValue1 ??= false,
                                    onChanged: (newValue) async {
                                      setState(() => _model.checkboxValue1 = newValue!);
                                    },
                                    side: BorderSide(
                                      width: 2,
                                      color: FlutterFlowTheme.of(context).primary,
                                    ),
                                    activeColor: FlutterFlowTheme.of(context).primary,
                                    checkColor: FlutterFlowTheme.of(context).primaryText,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Dispense and record applicable information.\nLabel each container with the material description, initial and date\n',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context).alternate,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                child: Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    unselectedWidgetColor: FlutterFlowTheme.of(context).primary,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValue2 ??= false,
                                    onChanged: (newValue) async {
                                      setState(() => _model.checkboxValue2 = newValue!);
                                    },
                                    side: BorderSide(
                                      width: 2,
                                      color: FlutterFlowTheme.of(context).primary,
                                    ),
                                    activeColor: FlutterFlowTheme.of(context).primary,
                                    checkColor: FlutterFlowTheme.of(context).primaryText,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Checking Here Provides A Digital Initial',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context).alternate,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    _showVerificationDialog();
                                  },
                                  text: 'Next',
                                  options: FFButtonOptions(
                                    height: 25.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(15.0, 1.0, 15.0, 1.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 20.0)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}