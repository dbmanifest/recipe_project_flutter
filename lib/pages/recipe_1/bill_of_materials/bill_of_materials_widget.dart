import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'bill_of_materials_model.dart';
export 'bill_of_materials_model.dart';

class BillOfMaterialsWidget extends StatefulWidget {
  const BillOfMaterialsWidget({super.key});

  @override
  State<BillOfMaterialsWidget> createState() => _BillOfMaterialsWidgetState();
}

class _BillOfMaterialsWidgetState extends State<BillOfMaterialsWidget> {
  late BillOfMaterialsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BillOfMaterialsModel());
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
                print('Button pressed ...');
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
                  child: FlutterFlowDataTable<dynamic>(
                    controller: _model.paginatedDataTableController,
                    data: paginatedDataTableRecordList,
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
                    dataRowBuilder: (Item, paginatedDataTableIndex, selected,
                            onSelectChanged) =>
                        DataRow(
                      selected: selected,
                      onSelectChanged: onSelectChanged,
                      color: MaterialStateProperty.all(
                        paginatedDataTableIndex % 2 == 0
                            ? FlutterFlowTheme.of(context).secondaryBackground
                            : FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      cells: [
                        Text(
                          'Water for Injection (WFI)',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          '100037',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ].map((c) => DataCell(c)).toList(),
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
                    horizontalDividerColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    horizontalDividerThickness: 1.0,
                    addVerticalDivider: false,
                    checkboxUnselectedFillColor: Colors.transparent,
                    checkboxSelectedFillColor: Colors.transparent,
                    checkboxCheckColor: const Color(0x8A000000),
                    checkboxUnselectedBorderColor: const Color(0x8A000000),
                    checkboxSelectedBorderColor: const Color(0x8A000000),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
