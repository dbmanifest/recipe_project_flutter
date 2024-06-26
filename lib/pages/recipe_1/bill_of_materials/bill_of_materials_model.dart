import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bill_of_materials_widget.dart' show BillOfMaterialsWidget;
import 'package:flutter/material.dart';

class BillOfMaterialsModel extends FlutterFlowModel<BillOfMaterialsWidget> {
  ///  State fields for stateful widgets in this page.
 // Dummy data for the data table
  final List<Map<String, dynamic>> dummyData = [
    {'description': 'Water for Injection (WFI)', 'itemNumber': '100037'},
    {'description': 'Sodium Chloride', 'itemNumber': '100038'},
    {'description': 'Potassium Chloride', 'itemNumber': '100039'},
    {'description': 'Calcium Chloride', 'itemNumber': '100040'},
    {'description': 'Magnesium Chloride', 'itemNumber': '100041'},
  ];
  final unfocusNode = FocusNode();

  bool get allItemsSelected => dummyData.every((item) => item['isSelected'] == true);

  void toggleItemSelection(int index) {
    dummyData[index]['isSelected'] = !(dummyData[index]['isSelected'] as bool);
  }
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<dynamic>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
