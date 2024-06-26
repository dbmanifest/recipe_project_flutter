import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'bill_of_materials_model.dart';
export 'bill_of_materials_model.dart';
import '/pages/state_model/recipe_state_model.dart';

class BillOfMaterialsWidget extends StatefulWidget {
  final RecipeState? initialState;

  const BillOfMaterialsWidget({Key? key, this.initialState}) : super(key: key);

  @override
  State<BillOfMaterialsWidget> createState() => _BillOfMaterialsWidgetState();
}

class _BillOfMaterialsWidgetState extends State<BillOfMaterialsWidget> {
  late BillOfMaterialsModel _model;
  late RecipeState _recipeState;
  bool _isConfirmed = false;
  final _verificationCodeController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BillOfMaterialsModel());
    _recipeState = widget.initialState ?? RecipeState();

    // Load existing data if available
    if (_recipeState.runData.containsKey('billOfMaterials')) {
      final billOfMaterials = _recipeState.runData['billOfMaterials'] as Map<String, dynamic>;
      _model.dummyData = billOfMaterials['stepData']['billOfMaterials'] as List<Map<String, dynamic>>;
      
      // Initialize text controllers with existing values
      _model.textControllers = _model.dummyData.map((item) {
        return TextEditingController(text: item['enteredValue'] as String?);
      }).toList();

      // Load verification data
      _isConfirmed = true; // Assuming if data exists, it was confirmed
      _verificationCodeController.text = billOfMaterials['verificationCode'] as String;
    } else {
      // Initialize with empty controllers if no existing data
      _model.textControllers = List.generate(_model.dummyData.length, (_) => TextEditingController());
    }
  }

void _navigateToNextStep(String verificationCode) {
  final updatedState = _recipeState.copyWith(
    runData: {
      ..._recipeState.runData,
      'bill_of_materials': {
        'stepData': {
          'billOfMaterials': _model.dummyData.asMap().map((index, item) => MapEntry(index, {
            ...item,
            'itemNumber': _model.textControllers[index].text,
          })),
        },
        'verificationCode': verificationCode,
        'verifiedAt': DateTime.now().toIso8601String(),
        'recordedBy': 'user',
        'recordedAt': DateTime.now().toIso8601String(),
      },
    },
  );

  // Navigate to the next step
  context.pushNamed(
    'recipe_1_step_1',
    extra: <String, dynamic>{'recipeState': updatedState},
  );
}
  void _showVerificationDialog(String verificationCode) {
     
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
                          _navigateToNextStep(verificationCode);                         
}
                      : null
                ),
              ],
            );
          }
        );
      },
    );
  }

   void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Not all items are selected. Are you sure you want to continue?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Continue'),
              onPressed: () {
                Navigator.of(context).pop();
                _showVerificationDialog();
              },
            ),
          ],
        );
      },
    );
  }



  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Bill Of Materials',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            FFButtonWidget(
              onPressed: () {
                if (_model.allItemsSelected) {
                  _showVerificationDialog(_verificationCodeController.text);
                  _model.textControllers.forEach((controller) {
                    controller.clear();
                  });
                } else {
                  _showConfirmationDialog();

                }
              },
              text: 'Next',
              options: FFButtonOptions(
                height: 40.0,
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Outfit',
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
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: FlutterFlowDataTable<Map<String, dynamic>>(
                    controller: _model.paginatedDataTableController,
                    data: _model.dummyData,
                    columnsBuilder: (onSortChanged) => [
                      DataColumn2(
                        label: DefaultTextStyle.merge(
                          softWrap: true,
                          child: Text(
                            'Description',
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      DataColumn2(
                        label: DefaultTextStyle.merge(
                          softWrap: true,
                          child: Text(
                            'Item Number',
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: const Color(0xFFF8F8F8),
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ],
                    dataRowBuilder: (item, index, selected, onSelectChanged) =>
                        DataRow(
                      color: MaterialStateProperty.all(
                        index % 2 == 0
                            ? FlutterFlowTheme.of(context).secondaryBackground
                            : FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      cells: [
                        DataCell(Text(
                          item['description'],
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0.0,
                              ),
                        )),
                        DataCell(Text(
                          item['itemNumber'],
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    )),
                                  ],
                                ),
                          paginated: true,
                          selectable: true,
                          hidePaginator: false,
                          showFirstLastButtons: false,
                          headingRowHeight: 56.0,
                          dataRowHeight: 48.0,
                          columnSpacing: 20.0,
                          headingRowColor: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(8.0),
                          addHorizontalDivider: true,
                          addTopAndBottomDivider: false,
                          hideDefaultHorizontalDivider: true,
                          horizontalDividerColor: FlutterFlowTheme.of(context).secondaryBackground,
                          horizontalDividerThickness: 1.0,
                          addVerticalDivider: false,
                          checkboxUnselectedFillColor: Colors.transparent,
                          checkboxSelectedFillColor: Colors.transparent,
                          checkboxCheckColor: const Color(0x8A000000),
                          checkboxUnselectedBorderColor: const Color(0x8A000000),
                          ) ,
                        ),
                      ),
],
),
),
),
);
}
}