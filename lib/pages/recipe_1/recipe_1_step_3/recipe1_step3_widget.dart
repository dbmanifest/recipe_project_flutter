import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'recipe1_step3_model.dart';
export 'recipe1_step3_model.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Recipe1Step3Widget extends StatefulWidget {
  const Recipe1Step3Widget({super.key});

  @override
  State<Recipe1Step3Widget> createState() => _Recipe1Step3WidgetState();
}

class _Recipe1Step3WidgetState extends State<Recipe1Step3Widget> {
  late Recipe1Step3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
                          context.pushNamed('recipe_1_step_4');
                        }
                      : null,
                ),
              ],
            );
          }
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Recipe1Step3Model());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    // Initialize checkbox values
    _model.checkboxValues1 = [false, false];
    _model.checkboxValues2 = [false, false];
    _model.checkboxValues3 = [false, false];
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Widget buildCheckboxGroup(String label1, String label2, bool? checkboxValue1, bool? checkboxValue2, ValueChanged<bool?> onChanged1, ValueChanged<bool?> onChanged2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: checkboxValue1,
                onChanged: onChanged1,
                side: BorderSide(width: 2, color: FlutterFlowTheme.of(context).primary),
                activeColor: FlutterFlowTheme.of(context).primary,
                checkColor: FlutterFlowTheme.of(context).primaryText,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  label1,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).alternate,
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: checkboxValue2,
                onChanged: onChanged2,
                side: BorderSide(width: 2, color: FlutterFlowTheme.of(context).primary),
                activeColor: FlutterFlowTheme.of(context).primary,
                checkColor: FlutterFlowTheme.of(context).primaryText,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  label2,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).alternate,
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
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
            'Step 3',
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
            builder: (context, constraints) {
              double width = constraints.maxWidth;

              return Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Pre-Use Filter Integrity Testing Pt 2.',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                    buildFieldWithCheckboxes('Sterile filter 1 (Upstream) Bubblepoint Test\nLimit: 50 PSI\n', _model.textController1, _model.textFieldFocusNode1, _model.checkboxValues1, width),
                    buildFieldWithCheckboxes('Sterile filter 2 (Downstream) Bubblepoint Test\nLimit: 50 PSI\n', _model.textController2, _model.textFieldFocusNode2, _model.checkboxValues2, width),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                  ].divide(const SizedBox(height: 20.0)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildFieldWithCheckboxes(
    String hintText,
    TextEditingController controller,
    FocusNode focusNode,
    List<bool> checkboxValues,
    double width,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          SizedBox(
            width: width * 0.6,
            child: TextFormField(
              controller: controller,
              focusNode: focusNode,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).alternate,
                      letterSpacing: 0.0,
                    ),
                alignLabelWithHint: true,
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
          buildCheckboxGroup('Recorded By Digital Initials', 'Verified By Initials', checkboxValues[0], checkboxValues[1], (newValue) => setState(() => checkboxValues[0] = newValue!), (newValue) => setState(() => checkboxValues[1] = newValue!)),
        ],
      ),
    );
  }
}
